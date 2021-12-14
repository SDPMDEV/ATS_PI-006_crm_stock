<?php


defined('BASEPATH') or exit('No direct script access allowed');

class Fiscal extends MY_Controller
{
    private $path = "../themes/ats_blue/admin/views/fiscal/";

    public $api_url;

    public $api_token = '$2y$10$k9zHL8kl3ONamH6tSIcF0Oe/WnlPPpBZ5915r3z8IUYdFuR0PDrsC';

    private $post;

    public function __construct()
    {
        parent::__construct();

        $this->post = $this->toJson($_POST);
        $config = new CI_Config();
        $this->api_url = $config->config["api_url"];
        $this->load->admin_model('products_model');

        if(!isset($this->post->ajax) && !$this->post->ajax) {
            if (!$this->loggedIn) {
                $this->session->set_userdata('requested_page', $this->uri->uri_string());
                $this->sma->md('login');
            }
            if ($this->Supplier || $this->Customer) {
                $this->session->set_flashdata('warning', lang('access_denied'));
                redirect($_SERVER['HTTP_REFERER']);
            }
        }
    }

    private function toJson(array $arr)
    {
        $json = new stdClass();
        foreach($arr as $index => $value) {
            $json->$index = $value;
        }

        return $json;
    }

    private function renderView(string $view_name, array $data = [])
    {
        $this->load->view($this->theme . 'header', $this->data);
        $this->load->view($this->path . $view_name, $data);
        $this->load->view($this->theme . 'footer');
    }


    private function returnApiProps(string $endpoint, array $data = [])
    {
        $ch = curl_init($this->api_url . $endpoint);

        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);

        if(!empty($data)) {
            unset($data["api_url"]);
            unset($data["ajax"]);
            $data["api_token"] = $this->api_token;

            curl_setopt($ch, CURLOPT_POSTFIELDS, "api_token=$this->api_token&".http_build_query($data));
        } else {
            curl_setopt($ch, CURLOPT_POSTFIELDS, "api_token=$this->api_token");
        }

        if(curl_exec($ch)) {
            return json_decode(curl_exec($ch));
        } else {
            return curl_error($ch);
        }
    }

    private function formatCNPJ($doc) 
    {
 
        $doc = preg_replace("/[^0-9]/", "", $doc);
        $qtd = strlen($doc);
 
        if($qtd >= 11) {
 
            if($qtd === 11 ) {
 
                $docFormatado = substr($doc, 0, 3) . '.' .
                                substr($doc, 3, 3) . '.' .
                                substr($doc, 6, 3) . '.' .
                                substr($doc, 9, 2);
            } else {
                $docFormatado = substr($doc, 0, 2) . '.' .
                                substr($doc, 2, 3) . '.' .
                                substr($doc, 5, 3) . '/' .
                                substr($doc, 8, 4) . '-' .
                                substr($doc, -2);
            }
 
            return $docFormatado;
 
        } else {
            return '';
        }
    }

    public function configure_issuer()
    {
        $props = $this->returnApiProps("/get_issuer");
        $props->cnpj = $this->formatCNPJ($props->cnpj);

        $data = [
            "props" => $props, 
            "remote_url" => $this->api_url,
            "configs" => $this->returnApiProps("/get_issuer_configs"),
            "token" => $this->api_token,
            'issuer' => $this->returnApiProps('/get_issuer'),
            'message' => $this->session->flashdata('error')
        ];


        $this->renderView("configure_issuer", $data);
    }

    public function configure_office()
    {
        $data = [
            "configs" => (array)$this->returnOfficeConfigs(), 
            "token" => $this->api_token,
            "remote_url" => $this->api_url
        ];
        
        $this->renderView("configure_office", $data);
    }

    private function returnOfficeConfigs()
    {
        return $this->returnApiProps("/get_office_configs");
    }

    public function manifest()
    {
        if($this->returnApiProps('/validate_certificate')->manifest_perm) {
            $this->renderView("manifest_files", [
                'configs' => $this->returnApiProps("/get_docs"),
                'remote_url' => $this->api_url,
                'categories' => $this->site->getAllCategories(),
            ]);   
        } else {
            $this->load->helper('url');
            $this->session->set_flashdata('error', 'É necessário configurar o emitente e o certificado antes de manifestar.');
            redirect('/admin/fiscal/configurar_emitente', 'refresh');
        }
    }

    public function nature_operation()
    {
        $data = [
            "naturezas" => $this->returnApiProps("/get_nature_configs"),
            "total_registros" => count($this->returnApiProps("/get_nature_configs")),
            "remote_url" => $this->api_url,
            "api_token" => $this->api_token
        ];

        $this->renderView("nature_operation", $data);
    }

    public function send_xml()
    {
        $data = [
            "remote_url" => $this->api_url
        ];
        
        $this->renderView("send_xml", $data);
    }

    public function taxation()
    {
        $data = [
            "api_token" => $this->api_token,
            "remote_url" => $this->api_url,
            "configs" => $this->returnApiProps("/get_taxation_configs")
        ];

        $this->renderView("taxation", $data);
    }

    private function responseJson(array $data)
    {
        $json = new stdClass();

        foreach($data as $index => $value) {
            $json->$index = $value;
        }

        header('Content-Type: application/json');
        exit(json_encode($json));
    }

    public function send_requests($endpoint = '', $data = [])
    {
        if(isset($this->post->api_url)) {
            if(strpos($this->post->api_url, 'get_download_configs') !== false) {
                $data = $this->returnApiProps($this->post->api_url, (array) $this->post);
                foreach($data->itens as $dt) {
                    $code = (array) $dt->codigo;
                    $dt->produtoNovo = $this->check_product($code[0]);
                    $dt->id = $this->getProductId($code[0]);
                }
                $this->responseJson((array)$data);
            } else {
                $this->responseJson((array) $this->returnApiProps($this->post->api_url, (array) $this->post));
            }
        } else if(!empty($api_url)) {
            $this->responseJson((array) $this->returnApiProps($endpoint, $data));
        } else {
            $this->responseJson(["error" => true, "message" => "Url da api não informada."]);
        }
    }

    public function addProduct()
    {
        if($this->input->method() != 'post' || $this->input->method() == 'POST') {
            redirect('/', 'refresh');
        }

        $data = [
            'code' => $this->input->post('code'),
            'price' => $this->input->post('valor_venda'),
            'cost' => $this->input->post('valor'),
            'category_id' => $this->input->post('category'),
            'type' => 'standard',
            'barcode_symbology' => $this->input->post('barcode_symbology'),
            'hide' => $this->input->post('hide') ? $this->input->post('hide') : 0,
            'hide_pos' => $this->input->post('hide_pos') ? $this->input->post('hide_pos') : 0,
            'name' => $this->input->post('name'),
            'NCM' => $this->input->post('ncm'),
            'fiscal' => 1,
            'CFOP_saida_estadual' => $this->input->post('cfop_saida_estudal'),
            'codBarras' => $this->input->post('codigo_barras'),
            'unidade_compra' => $this->input->post('unidade_compras'),
            'unidade_venda' => $this->input->post('unidade_vendas'),
            'quantity' => $this->input->post('quantidade'),
            'CST_IPI' => $this->input->post('cst_IPI'),
            'conversao_unitaria' => $this->input->post('conversao_estoque'),
            'cor' => $this->input->post('cor'),
            'CST_PIS' => $this->input->post('cst_PIS'),
            'CST_CSOSN' => $this->input->post('cst_CSOSN'),
            'CST_COFINS' => $this->input->post('cst_COFINS'),
            'CEST' => $this->input->post('cest'),
            'views' => 0,
            'referencia' => $this->input->post('referencia')
        ];

        foreach($data as $index => $dt) {
            if(empty($dt) && $index != 'hide' && $index != 'hide_pos' && $index != 'type' && $index != 'views')
                $this->responseJson(["error" => true, "message" => "Preencha todos os campos corretamente para prosseguir. Campo não pode ser nulo: ".lang($index, $index)]);
        }

        try {
            if($this->products_model->addAjaxProduct($data))
                $this->responseJson(["error" => false, "message" => "Produto salvo com sucesso!"]);
            else
                $this->responseJson(["error" => true, "message" => "Erro ao salvar produto."]);
        } catch (Exception $e) {
            $this->responseJson([
                "error" => true,
                "message" => $e->getMessage()
            ]);
        }
    }

    private function check_product($product_ref = '')
    {
        return (!$this->products_model->getProductByRef($product_ref));
    }

    private function getProductId($product_ref = '')
    {
        return $this->products_model->getProductId($product_ref);
    }
}
