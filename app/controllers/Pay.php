<?php

use Stripe\Charge;
use Stripe\Stripe;
use MercadoPago;
use Carbon\Carbon;

defined('BASEPATH') or exit('No direct script access allowed');

class Pay extends MY_Shop_Controller
{
    protected $token; // Token de acesso à API.
    protected $curlHeaders; // Array com os dados de cabeçalho das requisições.
    protected $contractNumber; // Número que identifica o contrato do beneficiário no Sisbr.
    protected $checkingAccountNumber; // Número da Conta Corrente onde será realizado o crédito da liquidação do boleto.
    protected $clientId; // Consumer Key (client_id).
    protected $oldToken; // Token antigo de acesso à API.

    public function __construct()
    {
        parent::__construct();
        $this->load->model('pay_model');

        $sicoob = $this->pay_model->getSicoobSettings();
        if($sicoob){
            // Resgatamos o refresh token do banco, para gerar um novo
            $this->token = $sicoob->access_token;
            $this->clientId = $sicoob->client_id;
            $this->contractNumber = $sicoob->contract_number ;
            $this->checkingAccountNumber = $sicoob->checking_account_number;
            $this->curlHeaders = [
                'Content-Type: application/json',
                'Authorization: Bearer '.$this->token
            ];
        }
    }

    public function index()
    {
        if (!SHOP) {
            redirect('admin');
        }
        redirect();
    }

    public function paypal($id)
    {
        if ($inv = $this->pay_model->getSaleByID($id)) {
            $paypal = $this->pay_model->getPaypalSettings();
            if ($paypal->active && (($inv->grand_total - $inv->paid) > 0)) {
                $customer = $this->pay_model->getCompanyByID($inv->customer_id);
                $biller   = $this->pay_model->getCompanyByID($inv->biller_id);
                if (trim(strtolower($customer->country)) == $biller->country) {
                    $paypal_fee = $paypal->fixed_charges + ($inv->grand_total * $paypal->extra_charges_my / 100);
                } else {
                    $paypal_fee = $paypal->fixed_charges + ($inv->grand_total * $paypal->extra_charges_other / 100);
                }
                $data = [
                    'rm'            => 2,
                    'no_note'       => 1,
                    'no_shipping'   => 1,
                    'bn'            => 'BuyNow',
                    'item_number'   => $inv->id,
                    'item_name'     => $inv->reference_no,
                    'return'        => urldecode(site_url('pay/pipn')),
                    'notify_url'    => urldecode(site_url('pay/pipn')),
                    'currency_code' => $this->default_currency->code,
                    'cancel_return' => urldecode(site_url('pay/pipn')),
                    'amount'        => (($inv->grand_total - $inv->paid) + $paypal_fee),
                    'image_url'     => base_url() . 'assets/uploads/logos/' . $this->Settings->logo,
                    'business'      => (DEMO ? 'saleem-facilitator@tecdiary.com' : $paypal->account_email),
                    'custom'        => $inv->reference_no . '__' . ($inv->grand_total - $inv->paid) . '__' . $paypal_fee,
                ];
                $query = http_build_query($data, null, '&');
                redirect('https://www' . (DEMO ? '.sandbox' : '') . '.paypal.com/cgi-bin/webscr?cmd=_xclick&' . $query);
            }
        }
        $this->session->set_flashdata('error', lang('sale_x_found'));
        redirect('/');
    }

    public function pipn()
    {
        $paypal = $this->pay_model->getPaypalSettings();
        $this->sma->log_payment('INFO', 'Paypal IPN called');
        $ipnstatus = false;

        $req = 'cmd=_notify-validate';
        foreach ($_POST as $key => $value) {
            // foreach ($_REQUEST as $key => $value) {
            $value = urlencode(stripslashes($value));
            $req .= "&$key=$value";
        }
        $this->sma->log_payment('INFO', 'Paypal Payment Request', $req);

        $header = "POST /cgi-bin/webscr HTTP/1.1\r\n";
        $header .= "Content-Type: application/x-www-form-urlencoded\r\n";
        $header .= 'Host: www' . (DEMO ? '.sandbox' : '') . ".paypal.com\r\n";
        // $header .= "Host: www.paypal.com\r\n";
        $header .= 'Content-Length: ' . strlen($req) . "\r\n";
        $header .= "Connection: close\r\n\r\n";

        $fp = fsockopen('ssl://www' . (DEMO ? '.sandbox' : '') . '.paypal.com', 443, $errno, $errstr, 30);
        // $fp = fsockopen('ssl://www.paypal.com', 443, $errno, $errstr, 30);

        if (!$fp) {
            $this->sma->log_payment('ERROR', 'Paypal Payment Failed (IPN HTTP ERROR)', $errstr);
            $this->session->set_flashdata('error', lang('payment_failed'));
        } else {
            fputs($fp, $header . $req);
            while (!feof($fp)) {
                $res = fgets($fp, 1024);
                //log_message('error', 'Paypal IPN - fp handler -'.$res);
                if (stripos($res, 'VERIFIED') !== false) {
                    $this->sma->log_payment('INFO', 'Paypal IPN - VERIFIED');

                    // $custom      = explode('__', $_POST['custom']);
                    // $payer_email = $_POST['payer_email'];
                    $invoice_no = $_POST['item_number'] ?? $_POST['item_number1'];
                    $reference  = $_POST['item_name']   ?? $_POST['item_name1'];

                    if (($_POST['payment_status'] == 'Completed' || $_POST['payment_status'] == 'Processed' || $_POST['payment_status'] == 'Pending') && ($_POST['business'] == DEMO ? 'saleem-facilitator@tecdiary.com' : $paypal->account_email)) {
                        if ($_POST['mc_currency'] == $this->Settings->default_currency) {
                            $amount = $_POST['mc_gross'];
                        } else {
                            $currency = $this->site->getCurrencyByCode($_POST['mc_currency']);
                            $amount   = $_POST['mc_gross'] * (1 / $currency->rate);
                        }
                        if ($inv = $this->pay_model->getSaleByID($invoice_no)) {
                            $payment = [
                                'date'           => date('Y-m-d H:i:s'),
                                'sale_id'        => $invoice_no,
                                'reference_no'   => $this->site->getReference('pay'),
                                'amount'         => $amount,
                                'paid_by'        => 'paypal',
                                'transaction_id' => $_POST['txn_id'],
                                'type'           => 'received',
                                'note'           => $_POST['mc_currency'] . ' ' . $_POST['mc_gross'] . ' had been paid for the Sale Reference No ' . $inv->reference_no,
                            ];
                            if ($this->pay_model->addPayment($payment)) {
                                $customer = $this->pay_model->getCompanyByID($inv->customer_id);
                                $this->pay_model->updateStatus($inv->id, 'completed');
                                $this->sma->log_payment('SUCCESS', 'Payment has been made for Sale Reference #' . $reference . ' via Paypal (' . $_POST['txn_id'] . ').', json_encode($_POST));
                                $this->session->set_flashdata('message', lang('payment_added'));
                                $ipnstatus = true;

                                try {
                                    $this->load->library('parser');
                                    $parse_data = [
                                        'reference_number' => $reference,
                                        'contact_person'   => $customer->name,
                                        'company'          => $customer->company,
                                        'site_link'        => base_url(),
                                        'site_name'        => $this->Settings->site_name,
                                        'logo'             => '<img src="' . base_url('assets/uploads/logos/' . $this->Settings->logo) . '" alt="' . $this->Settings->site_name . '"/>',
                                    ];

                                    $msg     = file_get_contents('./themes/' . $this->Settings->theme . '/admin/views/email_templates/payment.html');
                                    $message = $this->parser->parse_string($msg, $parse_data);
                                    $this->sma->log_payment('SUCCESS', 'Payment has been made for Sale Reference #' . $reference . ' via Paypal (' . $_POST['txn_id'] . ').', json_encode($_POST));

                                    $this->sma->send_email($paypal->account_email, 'Payment made for sale ' . $inv->reference_no, $message);
                                } catch (\Exception $e) {
                                    $this->sma->log_payment('ERROR', 'Email Notification Failed: ' . $e->getMessage());
                                }

                                if ($inv->shop) {
                                    $this->load->library('sms');
                                    $this->sms->paymentReceived($inv->id, $payment['reference_no'], $payment['amount']);
                                }
                            }
                        }
                    } else {
                        $this->sma->log_payment('ERROR', 'Payment failed for Sale Reference #' . $reference . ' via Paypal (' . $_POST['txn_id'] . ').', json_encode($_POST));
                        $this->session->set_flashdata('error', lang('payment_failed'));
                    }
                } elseif (stripos($res, 'INVALID') !== false) {
                    $this->sma->log_payment('ERROR', 'INVALID response from Paypal. Payment failed via Paypal.', json_encode($_POST));
                    $this->session->set_flashdata('error', lang('payment_failed'));
                }
            }
            fclose($fp);
        }

        if ($inv->shop) {
            shop_redirect('orders/' . $inv->id . '/' . ($this->loggedIn ? '' : $inv->hash));
        }

        redirect(SHOP ? '/' : site_url($ipnstatus ? 'notify/payment_success' : 'notify/payment_failed'));
        exit();
    }

    public function sipn()
    {
        $skrill = $this->pay_model->getSkrillSettings();
        $this->sma->log_payment('INFO', 'Skrill IPN called', json_encode($_POST));
        $ipnstatus = false;

        if (isset($_POST['merchant_id']) && isset($_POST['md5sig'])) {
            $concatFields = $_POST['merchant_id'] . $_POST['transaction_id'] . strtoupper(md5($skrill->secret_word)) . $_POST['mb_amount'] . $_POST['mb_currency'] . $_POST['status'];

            if (strtoupper(md5($concatFields)) == $_POST['md5sig'] && $_POST['status'] == 2 && $_POST['pay_to_email'] == $skrill->account_email) {
                $invoice_no = $_POST['item_number'];
                $reference  = $_POST['item_name'];
                if ($_POST['mb_currency'] == $this->Settings->default_currency) {
                    $amount = $_POST['mb_amount'];
                } else {
                    $currency = $this->site->getCurrencyByCode($_POST['mb_currency']);
                    $amount   = $_POST['mb_amount'] * (1 / $currency->rate);
                }
                if ($inv = $this->pay_model->getSaleByID($invoice_no)) {
                    $payment = [
                        'date'           => date('Y-m-d H:i:s'),
                        'sale_id'        => $invoice_no,
                        'reference_no'   => $this->site->getReference('pay'),
                        'amount'         => $amount,
                        'paid_by'        => 'skrill',
                        'transaction_id' => $_POST['mb_transaction_id'],
                        'type'           => 'received',
                        'note'           => $_POST['mb_currency'] . ' ' . $_POST['mb_amount'] . ' had been paid for the Sale Reference No ' . $reference,
                    ];
                    if ($this->pay_model->addPayment($payment)) {
                        $customer = $this->site->getCompanyByID($inv->customer_id);
                        $this->pay_model->updateStatus($inv->id, 'completed');

                        $this->load->library('parser');
                        $parse_data = [
                            'reference_number' => $reference,
                            'contact_person'   => $customer->name,
                            'company'          => $customer->company,
                            'site_link'        => base_url(),
                            'site_name'        => $this->Settings->site_name,
                            'logo'             => '<img src="' . base_url('assets/uploads/logos/' . $this->Settings->logo) . '" alt="' . $this->Settings->site_name . '"/>',
                        ];

                        $msg     = file_get_contents('./themes/' . $this->Settings->theme . '/admin/views/email_templates/payment.html');
                        $message = $this->parser->parse_string($msg, $parse_data);
                        $this->sma->log_payment('SUCCESS', 'Payment has been made for Sale Reference #' . $_POST['item_name'] . ' via Skrill (' . $_POST['mb_transaction_id'] . ').', json_encode($_POST));
                        try {
                            $this->sma->send_email($skrill->account_email, 'Payment made for sale ' . $inv->reference_no, $message);
                        } catch (Exception $e) {
                            $this->sma->log_payment('Email Notification Failed: ' . $e->getMessage());
                        }
                        $this->session->set_flashdata('message', lang('payment_added'));
                        $ipnstatus = true;
                        if ($inv->shop) {
                            $this->load->library('sms');
                            $this->sms->paymentReceived($inv->id, $payment['reference_no'], $payment['amount']);
                        }
                    }
                }
            } else {
                $this->sma->log_payment('ERROR', 'Payment failed for via Skrill.', json_encode($_POST));
                $this->session->set_flashdata('error', lang('payment_failed'));
            }
        } else {
            redirect('notify/payment');
        }

        if ($inv->shop) {
            shop_redirect('orders/' . $inv->id . '/' . ($this->loggedIn ? '' : $inv->hash));
        }

        redirect(SHOP ? '/' : site_url($ipnstatus ? 'notify/payment_success' : 'notify/payment_failed'));
        exit();
    }

    public function sicoob($id, $has = null)
    {
        $inv = $this->pay_model->getSaleByID($id);
        $customer = $this->pay_model->getCompanyByID($inv->customer_id);   
        $order = $this->shop_model->getOrder(['id' => $id, 'hash' => $inv->hash]);
        $this->data['id']         = $id;
        $this->data['inv']         = $order;
        $this->data['rows']        = $this->shop_model->getOrderItems($id);
                   
        $this->data['customer']    = $this->site->getCompanyByID($order->customer_id);
        $this->data['biller']      = $this->site->getCompanyByID($order->biller_id);
        $this->data['address']     = $this->shop_model->getAddressByID($order->address_id);
        $this->data['return_sale'] = $order->return_id ? $this->shop_model->getOrder(['id' => $id]) : null;
        $this->data['return_rows'] = $order->return_id ? $this->shop_model->getOrderItems($order->return_id) : null;
        $this->data['paypal']      = $this->shop_model->getPaypalSettings();
        $this->data['skrill']      = $this->shop_model->getSkrillSettings();
        $this->data['page_title']  = lang('view_order');
        $this->data['page_desc']   = '';

        $date = date('Y-m-d\TH:i:s.v-00:00');
        $expirationDate = date('Y-m-d\TH:i:s.v-03:00', strtotime($date. ' + 5 days'));
        $this->refreshToken();
        
        $address = $this->shop_model->getAddressByID($order->address_id);

        $email = $customer->email;
        $docNumber = $customer->cpf;
        $customerName = $customer->name;
        $amount = $inv->grand_total;

        $body = [
            "numeroContrato" => (int)$this->contractNumber, // Número que identifica o contrato do beneficiário no Sisbr.
            "modalidade" => 1, // Número que identifica a modalidade do boleto. Infomar 1 - SIMPLES COM REGISTRO
            "numeroContaCorrente" => (int)$this->checkingAccountNumber, // Número da Conta Corrente onde será realizado o crédito da liquidação do boleto.
            "especieDocumento" => "DM", // Espécie do Documento. - CH - Cheque - DM - Duplicata Mercantil - DMI - Duplicata Mercantil Indicação - DS - Duplicata de Serviço - DSI - Duplicata
            "seuNumero" => $id, // Número identificador do boleto no sistema do beneficiário.
            "identificacaoEmissaoBoleto" => 1, // Código de identificação de emissão do boleto. Informar os valores listados abaixo. - 1 Banco Emite - 2 Cliente Emite
            "identificacaoDistribuicaoBoleto" => 1, // Código de identificação de distribuição do boleto. Informar os valores listados abaixo. - 1 Banco Distribui - 2 Cliente Distribui
            "valor" => (float)$amount, // Valor nominal do boleto.
            "dataEmissao" => $date, // Data de vencimento do boleto.
            "dataVencimento" => $expirationDate, // Data de vencimento do boleto.
            "tipoDesconto" => 0, // Informar o tipo de desconto atribuido ao boleto de cobrança.Informar os valores listados abaixo. - 0 Sem Desconto - 1 Valor Fixo Até a Data Informada
            "numeroParcela" => 1, // Número da parcela do boleto.Valor máximo permitido '99'.
            "tipoJurosMora" => 3, // Número da parcela do boleto.Valor máximo permitido '99'.
            "tipoMulta" => 0, // Número da parcela do boleto.Valor máximo permitido '99'.
            "pagador" => [
                "numeroCpfCnpj" => $docNumber, // CPF ou CNPJ do pagador do boleto de cobrança.
                "nome"          => $customerName, // Nome completo do pagador do boleto de cobrança.
                "endereco"      => $address->line1, // Endereço do pagador do boleto de cobrança.
                "bairro"        => $address->line2, // Bairro do pagador do boleto de cobrança.
                "cidade"        => $address->city, // Cidade do pagador do boleto de cobrança.
                "cep"           => str_replace(['-','.'], '', $address->postal_code), // CEP do pagador.
                "uf"            => $address->state, // UF do pagador.
                "email"         => [ // OPCIONAL
                    $email
                ]
            ],
            "gerarPdf" => true // OPCIONAL Identificador para o sistema devolver ou não o PDF do Boleto. O PDF será retornado na Base64.
        ];
        var_dump(json_encode($body));
        return;
        $response = $this->jsonPost('https://api.sisbr.com.br/cooperado/cobranca-bancaria/v1/boletos', $body, true);
        $resJson = json_decode($response);

        if (isset($resJson->resultado[0]->boleto->linhaDigitavel)) {

        }
        $this->page_construct('pages/sicoob', $this->data);
        return;
    }

    public function refreshToken()
    {
        $sicoob = $this->pay_model->getSicoobSettings();
        $clientId = $sicoob->client_id;
        // Resgatamos o refresh token do banco, para gerar um novo
        $this->oldToken = $sicoob->refresh_token;

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://api.sisbr.com.br/auth/token");
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, "grant_type=refresh_token&refresh_token=".$this->oldToken);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt(
            $ch,
            CURLOPT_HTTPHEADER,
            array(
                'Content-Type: application/x-www-form-urlencoded',
                'Authorization: Basic T3JicFdtZXpfa2NvdUh5cWxkcnJGX2JKbkZZYTpuXzBZdTJ4QTNqNEFqb21SYXNyWExnUFhPRVVh'
            )
        );

        $result = curl_exec($ch);
        $result = json_decode($result);

        if (!isset($result->access_token)) {
            return;
        }

        // Adicionamos os novos tokens na tabela
        $this->load->admin_model('sicoob_model');
        $this->sicoob_model->update($sicoob->id, ["access_token" => $result->access_token, "refresh_token" => $result->refresh_token]);

        $this->token = $result->access_token;
    }

    public function jsonPost($url, $data, $sendClient = false)
    {
        $data = json_encode([$data]);
        $countHeaders = count($headers);
        
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        // The maximum amount of seconds that cURL should spend attempting to connect to a given URL.
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 2);
        // The maximum amount of time that the request should take.
        curl_setopt($ch, CURLOPT_TIMEOUT, 5);
        if ($sendClient) {
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Content-Type: application/json',
                'Authorization: Bearer '.$this->token,
                'Client_id: '.$this->clientId
            ]);
        } else {
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Content-Type: application/json',
                'Authorization: Bearer '.$this->token
            ]);
        }

        $result = curl_exec($ch);
        return $result;
    }

    public function mp($id, $has = null)
    {
        $inv = $this->pay_model->getSaleByID($id);
        $customer = $this->pay_model->getCompanyByID($inv->customer_id);
        
        $order = $this->shop_model->getOrder(['id' => $id, 'hash' => $hash]);
      

        $this->data['id']         = $id;
        $this->data['inv']         = $order;
        $this->data['rows']        = $this->shop_model->getOrderItems($id);

         foreach ($this->data['rows'] as $row){
          //  var_dump(json_encode($row));
         }
        // return;
                   
        $this->data['customer']    = $this->site->getCompanyByID($order->customer_id);
        $this->data['biller']      = $this->site->getCompanyByID($order->biller_id);
        $this->data['address']     = $this->shop_model->getAddressByID($order->address_id);
        $this->data['return_sale'] = $order->return_id ? $this->shop_model->getOrder(['id' => $id]) : null;
        $this->data['return_rows'] = $order->return_id ? $this->shop_model->getOrderItems($order->return_id) : null;
        $this->data['paypal']      = $this->shop_model->getPaypalSettings();
        $this->data['skrill']      = $this->shop_model->getSkrillSettings();
        $this->data['page_title']  = lang('view_order');
        $this->data['page_desc']   = '';

        $this->config->load('payment_gateways');
        $this->data['stripe_secret_key']      = $this->config->item('stripe_secret_key');
        $this->data['stripe_publishable_key'] = $this->config->item('stripe_publishable_key');

        $this->page_construct('pages/mercado-pago', $this->data);
        return;
        
        if ($inv = $this->pay_model->getSaleByID($id)) {
            //var_dump(json_encode($inv));
            //return;
            $skrill = $this->pay_model->getSkrillSettings();
            if ($skrill->active && (($inv->grand_total - $inv->paid) > 0)) {
                $customer = $this->pay_model->getCompanyByID($inv->customer_id);
                $biller   = $this->pay_model->getCompanyByID($inv->biller_id);
                if (trim(strtolower($customer->country)) == $biller->country) {
                    $skrill_fee = $skrill->fixed_charges + ($inv->grand_total * $skrill->extra_charges_my / 100);
                } else {
                    $skrill_fee = $skrill->fixed_charges + ($inv->grand_total * $skrill->extra_charges_other / 100);
                }
                redirect('https://www.moneybookers.com/app/payment.pl?method=get&pay_to_email=' . $skrill->account_email . '&language=EN&merchant_fields=item_name,item_number&item_name=' . $inv->reference_no . '&item_number=' . $inv->id . '&logo_url=' . base_url() . 'assets/uploads/logos/' . $this->Settings->logo . '&amount=' . (($inv->grand_total - $inv->paid) + $skrill_fee) . '&return_url=' . shop_url('orders/' . $inv->id) . '&cancel_url=' . site_url('/') . '&detail1_description=' . $inv->reference_no . '&detail1_text=Payment for the sale invoice ' . $inv->reference_no . ': ' . $inv->grand_total . '(+ fee: ' . $skrill_fee . ') = ' . $this->sma->formatMoney($inv->grand_total + $skrill_fee) . '&currency=' . $this->default_currency->code . '&status_url=' . site_url('pay/sipn'));
            }
        }
        $this->session->set_flashdata('error', lang('sale_x_found'));
        redirect('/');
    }

    public function skrill($id)
    {
        if ($inv = $this->pay_model->getSaleByID($id)) {
            $skrill = $this->pay_model->getSkrillSettings();
            if ($skrill->active && (($inv->grand_total - $inv->paid) > 0)) {
                $customer = $this->pay_model->getCompanyByID($inv->customer_id);
                $biller   = $this->pay_model->getCompanyByID($inv->biller_id);
                if (trim(strtolower($customer->country)) == $biller->country) {
                    $skrill_fee = $skrill->fixed_charges + ($inv->grand_total * $skrill->extra_charges_my / 100);
                } else {
                    $skrill_fee = $skrill->fixed_charges + ($inv->grand_total * $skrill->extra_charges_other / 100);
                }
                redirect('https://www.moneybookers.com/app/payment.pl?method=get&pay_to_email=' . $skrill->account_email . '&language=EN&merchant_fields=item_name,item_number&item_name=' . $inv->reference_no . '&item_number=' . $inv->id . '&logo_url=' . base_url() . 'assets/uploads/logos/' . $this->Settings->logo . '&amount=' . (($inv->grand_total - $inv->paid) + $skrill_fee) . '&return_url=' . shop_url('orders/' . $inv->id) . '&cancel_url=' . site_url('/') . '&detail1_description=' . $inv->reference_no . '&detail1_text=Payment for the sale invoice ' . $inv->reference_no . ': ' . $inv->grand_total . '(+ fee: ' . $skrill_fee . ') = ' . $this->sma->formatMoney($inv->grand_total + $skrill_fee) . '&currency=' . $this->default_currency->code . '&status_url=' . site_url('pay/sipn'));
            }
        }
        $this->session->set_flashdata('error', lang('sale_x_found'));
        redirect('/');
    }

    public function tokenmp($id = null)
    {
        $rows = $this->shop_model->getOrderItems($this->input->post('order_id', true));

        $url = 'asdasd'; 
        $token = 'TEST-321093625686785-080523-2fe6a0bd4c0521aa6b46c325809332bf-802882834'; 
        MercadoPago\SDK::setAccessToken("{$token}");

        $preference = new MercadoPago\Preference();
        $items = [];
        foreach ($rows as $row){ 

            $item = new MercadoPago\Item();
            
            $item->title = $row->product_name;
            $item->quantity = $row->unit_quantity;
            $item->unit_price = $row->subtotal;
            $items[] = $item;
        }

        $preference->items = $items;
        $preference->back_urls = array(
            "success" => "{$url}/my-plan",
            "failure" => "{$url}/my-plan", 
            "pending" => "{$url}/my-plan"
        );

        $preference->auto_return = "approved";
        $preference->notification_url = "{$url}/api/postback/mercadopago";
        $preference->external_reference = $id; 
        $preference->save();
        $response = array(
            'id' => $preference->id,
        ); 

        echo json_encode($response);
    }

    public function stripe($id = null)
    {
        $stripeToken = $this->input->post('stripeToken');
        $stripeEmail = $this->input->post('stripeEmail');
        if (!$id || !$stripeToken) {
            show_404();
        }

        $this->config->load('payment_gateways');
        $inv         = $this->pay_model->getSaleByID($id);
        $description = lang('sale') . ' ' . lang('no.') . ' ' . $id;
        $grand_total = ($inv->grand_total - $inv->paid);
        $amount      = ($grand_total * 100);
        if ($stripeToken) {
            Stripe::setApiKey($this->config->item('stripe_secret_key'));
            try {
                $charge = Charge::create([
                    'amount'      => $amount,
                    'card'        => $stripeToken,
                    'description' => $description,
                    'currency'    => $this->default_currency->code,
                ]);
                // return $charge;
                if (strtolower($charge->currency) == strtolower($this->default_currency->code)) {
                    $payment = [
                        'date'           => date('Y-m-d H:i:s'),
                        'sale_id'        => $inv->id,
                        'reference_no'   => $this->site->getReference('pay'),
                        'amount'         => ($charge->amount / 100),
                        'paid_by'        => 'stripe',
                        'transaction_id' => $charge->id,
                        'type'           => 'received',
                        'note'           => $charge->currency . ' ' . ($charge->amount / 100) . ' had been paid by Stripe for the Sale Reference No ' . $inv->reference_no,
                    ];
                    if ($this->pay_model->addPayment($payment)) {
                        $customer = $this->pay_model->getCompanyByID($inv->customer_id);
                        $this->pay_model->updateStatus($inv->id, 'completed');
                        $this->site->syncSalePayments($inv->id);

                        $this->load->library('parser');
                        $parse_data = [
                            'reference_number' => $payment['reference_no'],
                            'contact_person'   => $customer->name,
                            'company'          => $customer->company,
                            'site_link'        => base_url(),
                            'site_name'        => $this->Settings->site_name,
                            'logo'             => '<img src="' . base_url('assets/uploads/logos/' . $this->Settings->logo) . '" alt="' . $this->Settings->site_name . '"/>',
                        ];

                        $msg     = file_get_contents('./themes/' . $this->Settings->theme . '/admin/views/email_templates/payment.html');
                        $message = $this->parser->parse_string($msg, $parse_data);
                        $this->sma->log_payment('SUCCESS', 'Payment has been made for Sale Reference #' . $inv->reference_no . ' via Stripe (' . $charge->id . ').', json_encode($_POST));
                        try {
                            $this->sma->send_email($customer->email, 'Payment made for sale ' . $inv->reference_no, $message);
                        } catch (Exception $e) {
                            $this->sma->log_payment('Email Notification Failed: ' . $e->getMessage());
                        }
                        $this->session->set_flashdata('message', lang('payment_added'));
                        $payments_received = true;
                        if ($inv->shop) {
                            $this->load->library('sms');
                            $this->sms->paymentReceived($inv->id, $inv->reference_no, ($charge->amount / 100));
                        }
                    }
                }
            } catch (Exception $e) {
                $this->session->set_flashdata('error', $e->getMessage());
                $this->sma->log_payment('ERROR', 'Payment failed for via Stripe.', json_encode($_POST));
                shop_redirect('orders/' . $inv->id . '/' . ($this->loggedIn ? '' : $inv->hash));
            }
        } else {
            redirect('notify/payment');
        }

        if ($inv->shop) {
            shop_redirect('orders/' . $inv->id . '/' . ($this->loggedIn ? '' : $inv->hash));
        }

        redirect(SHOP ? '/' : site_url($payments_received ? 'notify/payment_success' : 'notify/payment_failed'));
        exit();
    }
}
