<?php


defined('BASEPATH') or exit('No direct script access allowed');

class Fiscal extends MY_Controller
{

    /**
     * @var string
     */
    private string $path = "../themes/ats_blue/admin/views/fiscal/";

    /**
     * @var string|mixed
     */
    private string $api_url;

    /**
     * @var string|mixed
     */
    private string $api_token;

    /**
     * @var stdClass
     */
    private stdClass $post;

    /**
     * @var stdClass
     */
    private stdClass $get;


    /**
     * Determina valores da api, instancia models e verifica se o usuário está logado
     * antes de executar qualquer outra função da classe
     */
    public function __construct()
    {
        parent::__construct();

        $this->post = $this->toJson($_POST);
        $this->get = $this->toJson($_GET);

        $config = new CI_Config();
        $this->api_url = $config->config["api_url"];
        $this->api_token = $config->config['api_token'];

        $this->load->admin_model('products_model');
        $this->load->admin_model('sales_model');
        $this->load->admin_model('companies_model');
        $this->load->admin_model('nfe_model');

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

    /**
     * Converte um array para uma StdClass
     *
     * @param array $arr
     * @return stdClass
     */
    private function toJson(array $arr) : stdClass
    {
        $json = new stdClass();
        foreach($arr as $index => $value) {
            $json->$index = $value;
        }

        return $json;
    }

    /**
     * @param string $view_name
     * @param array $data
     */
    private function renderView(string $view_name, array $data = [])
    {
        $this->load->view($this->theme . 'header', $this->data);
        $this->load->view($this->path . $view_name, $data);
        $this->load->view($this->theme . 'footer');
    }


    /**
     * @param string $endpoint
     * @param array $data
     * @return mixed|string
     */
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

    /**
     * @param $doc
     * @return string
     */
    private function formatCNPJ($doc): string
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

    /**
     * Renderiza a view de configurar emitente
     */
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
            'message' => $this->session->flashdata('error'),
            'nfe_configs' => $this->nfe_model->getAllLastNumbers()
        ];


        $this->renderView("configure_issuer", $data);
    }

    /**
     * Renderiza a view de configurar escritório
     */
    public function configure_office()
    {
        $data = [
            "configs" => (array)$this->returnOfficeConfigs(), 
            "token" => $this->api_token,
            "remote_url" => $this->api_url
        ];
        
        $this->renderView("configure_office", $data);
    }

    /**
     * @return mixed|string
     */
    private function returnOfficeConfigs()
    {
        return $this->returnApiProps("/get_office_configs");
    }

    /**
     * Renderiza a view de Manifesto
     */
    public function manifest()
    {
        if($this->returnApiProps('/validate_certificate')->manifest_perm) {
            $this->renderView("manifest_files", [
                'configs' => $this->returnApiProps("/get_docs"),
                'remote_url' => $this->api_url,
                'categories' => $this->site->getAllCategories(),
                'warehouses' => $this->site->getAllWarehouses(),
                'tax_rates' => $this->site->getAllTaxRates()
            ]);   
        } else {
            $this->load->helper('url');
            $this->session->set_flashdata('error', 'É necessário configurar o emitente e o certificado antes de manifestar.');
            redirect('/admin/fiscal/configurar_emitente', 'refresh');
        }
    }

    /**
     * Renderiza view de natureza de operação
     */
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

    /**
     * Renderiza a view de enviar xml
     *
     * @deprecated
     */
    public function send_xml()
    {
        $data = [
            "remote_url" => $this->api_url
        ];
        
        $this->renderView("send_xml", $data);
    }

    /**
     * Renderiza a view de tributação
     */
    public function taxation()
    {
        $data = [
            "api_token" => $this->api_token,
            "remote_url" => $this->api_url,
            "configs" => $this->returnApiProps("/get_taxation_configs")
        ];

        $this->renderView("taxation", $data);
    }

    /**
     * @param array $data
     */
    private function responseJson(array $data)
    {
        $json = new stdClass();

        foreach($data as $index => $value) {
            $json->$index = $value;
        }

        header('Content-Type: application/json');
        exit(json_encode($json));
    }

    /**
     * Função responsável por capturar requisições Ajax do frontend
     * sem utilizar o token csrf
     *
     * @param string $endpoint
     * @param array $data
     */
    public function send_requests(string $endpoint = '', array $data = [])
    {
        $this->saveLastNumbers();

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

    /**
     * Função personalizada para inserir um produto no banco de dados
     */
    public function addProduct()
    {
        if($this->input->method() != 'post' || $this->input->method() == 'POST') {
            redirect('/', 'refresh');
        }

        $data = [
            'code' => $this->input->post('code'),
            'price' => $this->input->post('valor_venda'),
            'cost' => $this->input->post('valor_compra'),
            'category_id' => $this->input->post('category'),
            'type' => 'standard',
            'brand' => null,
            'unit' => null,
            'sale_unit' => null,
            'purchase_unit' => null,
            'subcategory_id' => null,
            'tax_rate' => $this->input->post('tax_rate'),
            'tax_method' => $this->input->post('tax_method'),
            'supplier1'         => null,
            'supplier1price'    => null,
            'supplier2'         => null,
            'supplier2price'    => null,
            'supplier3'         => null,
            'supplier3price'    => null,
            'supplier4'         => null,
            'supplier4price'    => null,
            'supplier5'         => null,
            'supplier5price'    => null,
            'cf1'               => null,
            'cf2'               => null,
            'cf3'               => null,
            'cf4'               => null,
            'cf5'               => null,
            'cf6'               => null,
            'alert_quantity' => null,
            'track_quantity' => null,
            'details' => null,
            'product_details' => null,
            'promotion'         => null,
            'promo_price'       => null,
            'start_date'        => null,
            'end_date'          => null,
            'supplier1_part_no' => null,
            'supplier2_part_no' => null,
            'supplier3_part_no' => null,
            'supplier4_part_no' => null,
            'supplier5_part_no' => null,
            'file'              => null,
            'slug'              => null,
            'weight'            => null,
            'featured'          => null,
            'hsn_code'          => null,
            'barcode_symbology' => $this->input->post('barcode_symbology'),
            'second_name'       => null,
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
            'referencia' => $this->input->post('referencia'),
        ];

        $items = [
            [
                'item_code' => $this->input->post('code'),
                'quantity' => $this->input->post('quantidade'),
                'unit_price' => $this->input->post('valor_venda')
            ]
        ];

        $warehouse_qty = [
            [
                'warehouse_id' => $this->input->post('warehouse'),
                'quantity' => $this->input->post("quantidade"),
                'rack' => null
            ]
        ];

        $product_attributes = [
            [
                'name'         => $this->input->post('name'),
                'warehouse_id' => $this->input->post('warehouse'),
                'quantity'     => $this->input->post("quantidade"),
                'price'        => $this->input->post('valor_compra'),
            ]
        ];

        if ($this->products_model->addProduct($data, $items, $warehouse_qty, $product_attributes, null))
            $this->responseJson(["error" => false, "message" => "Produto salvo com sucesso!"]);
        else
            $this->responseJson(["error" => true, "message" => "Erro ao salvar produto."]);
    }

    /**
     * @param string $product_ref
     * @return bool
     */
    private function check_product(string $product_ref = ''): bool
    {
        return (!$this->products_model->getProductByRef($product_ref));
    }

    /**
     * @param string $product_ref
     * @return mixed
     */
    private function getProductId(string $product_ref = '')
    {
        return $this->products_model->getProductId($product_ref);
    }

    public function generateDanfe()
    {
        if(isset($this->get->val)) {
            $products = [];
            if(count($this->get->val) == 1) {
                $sale = $this->sales_model->getSale($this->get->val[0]);
                $customer = $this->companies_model->getCustomerById($sale->customer_id);
                $products_id = explode(",", $sale->id_produtos);

                $frete = ($sale->tipo_frete != 9) ? [
                    'tipo' => $sale->tipo_frete,
                    'valor' => $sale->shipping,
                    'placa' => $sale->placa_vei,
                    'uf' => $sale->uf,
                    'qtdVolumes' => $sale->qntd_volumes,
                    'peso_liquido' => $sale->peso_liq,
                    'especie' => $sale->especie,
                    'peso_bruto' => $sale->peso_bruto,
                    'numeracaoVolumes' => $sale->num_volumes
                ] : null;

                foreach($products_id as $id) {
                    $pr = $this->products_model->getProductByID($id);
                    array_push($products, [
                        'id' => (int)$pr->id,
                        'nome' => $pr->name,
                        'NCM' => $pr->NCM,
                        'CST_CSOSN' => $pr->CST_CSOSN,
                        'CFOP_saida_estadual' => $pr->CFOP_saida_estadual,
                        'CFOP_saida_inter_estadual' => $pr->CFOP_saida_inter_estadual,
                        'CEST' => $pr->CEST,
                        'CST_IPI' => $pr->CST_IPI,
                        'unidade_venda' => $pr->unidade_venda,
                        'quantidade' => 1,
                        'valor' => $pr->price,
                        'perc_icms' => number_format($pr->perc_icms, 2),
                        'CST_PIS' => $pr->CST_PIS,
                        'perc_pis' => number_format($pr->perc_pis, 2),
                        'perc_iss' => number_format($pr->perc_iss, 2),
                        'perc_ipi' => number_format($pr->perc_ipi, 2),
                        'CST_COFINS' => $pr->CST_COFINS,
                        'perc_cofins' => number_format($pr->perc_cofins, 2),
                        'descricao_anp' => $pr->descricao_anp ?? '',
                        'codigo_anp' => number_format($pr->codigo_anp, 2),
                        'codBarras' => $pr->codBarras,
                        'cListServ' => $pr->cListServ
                    ]);
                }

                $data = [
                    'lastId' => ($this->nfe_model->getAllLastNumbers()->ultimo_num_nfe == null) ? 1 : $this->nfe_model->getAllLastNumbers()->ultimo_num_nfe,
                    'cpf' => '',
                    'cliente' => [
                        'cidade' => [
                            'codigo' => $this->returnApiProps('/get_issuer')->codMun,
                            'nome' => $customer->name,
                            'uf' => $customer->state,
                            'cep' => $customer->cep,
                        ],
                        'consumidor_final' => $customer->consumidor_final,
                        'razao_social' => $customer->company,
                        'ie_rg' => $customer->ie_rg,
                        'rua' => $customer->rua,
                        'numero' => $customer->rua,
                        'bairro' => $customer->bairro,
                        'contribuinte' => $customer->contribuinte,
                        'cep' => $customer->cep,
                        'cpf_cnpj' => $customer->cpf_cnpj
                    ],
                    'nome' => '',
                    'produtos' => $products,
                    'desconto' => 0,
                    'valor_total' => $sale->total,
                    'troco' => 0,
                    'tipo_pagamento' => $sale->tipo_pagamento,
                    'frete' => $frete,
                    'transportadora' => '',
                    'forma_pagamento' => $sale->payment_method,
                    'quantidades' => $sale->quantidades,
                    'observacao' => '',
                    'natureza' => [
                        "natureza" => $sale->natureza,
                        "CFOP_entrada_estadual" => $this->returnApiProps('/get_nature_configs')[0]->CFOP_entrada_estadual,
                        "CFOP_entrada_inter_estadual" => $this->returnApiProps('/get_nature_configs')[0]->CFOP_entrada_inter_estadual,
                        "CFOP_saida_estadual" => $this->returnApiProps('/get_nature_configs')[0]->CFOP_saida_estadual,
                        "CFOP_saida_inter_estadual" => $this->returnApiProps('/get_nature_configs')[0]->CFOP_saida_inter_estadual,
                    ],
                    'estado' => $sale->estado
                ];


                $ch = curl_init($this->api_url . '/generate_danfe/?' . http_build_query($data));
                curl_setopt_array($ch,[
                    CURLOPT_SSL_VERIFYPEER => false,
                    CURLOPT_CUSTOMREQUEST => "GET",
                    CURLOPT_RETURNTRANSFER => true,
                ]);

                header("Content-Type: application/pdf");
                echo curl_exec($ch);
            } else {
                echo '
                    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script>
                        window.onload = function() {
                            swal("Erro ao gerar Danfe!", "Selecione uma venda para gerar o Danfe \n (selecione uma única venda)", "error").then(()=>{
                                window.close();
                            });
                        };
                    </script>
                ';
            }
        } else {
            echo '
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    window.onload = function() {
                        swal("Erro ao gerar Danfe!", "Selecione uma venda para gerar o Danfe \n (selecione uma única venda)", "error").then(()=>{
                            window.close();
                        });
                    };
                </script>
            ';
        }
    }

    public function sendSale()
    {
        if(isset($this->get->val)) {
            $products = [];
            if(count($this->get->val) == 1) {
                $sale = $this->sales_model->getSale($this->get->val[0]);
                $customer = $this->companies_model->getCustomerById($sale->customer_id);
                $products_id = explode(",", $sale->id_produtos);

                if($sale->etado != 'APROVADO') {
                    $frete = ($sale->tipo_frete != 9) ? [
                        'tipo' => $sale->tipo_frete,
                        'valor' => $sale->shipping,
                        'placa' => $sale->placa_vei,
                        'uf' => $sale->uf,
                        'qtdVolumes' => $sale->qntd_volumes,
                        'peso_liquido' => $sale->peso_liq,
                        'especie' => $sale->especie,
                        'peso_bruto' => $sale->peso_bruto,
                        'numeracaoVolumes' => $sale->num_volumes
                    ] : null;

                    foreach($products_id as $id) {
                        $pr = $this->products_model->getProductByID($id);
                        array_push($products, [
                            'id' => (int)$pr->id,
                            'nome' => $pr->name,
                            'NCM' => $pr->NCM,
                            'CST_CSOSN' => $pr->CST_CSOSN,
                            'CFOP_saida_estadual' => $pr->CFOP_saida_estadual,
                            'CFOP_saida_inter_estadual' => $pr->CFOP_saida_inter_estadual,
                            'CEST' => $pr->CEST,
                            'CST_IPI' => $pr->CST_IPI,
                            'unidade_venda' => $pr->unidade_venda,
                            'quantidade' => 1,
                            'valor' => $pr->price,
                            'perc_icms' => number_format($pr->perc_icms, 2),
                            'CST_PIS' => $pr->CST_PIS,
                            'perc_pis' => number_format($pr->perc_pis, 2),
                            'perc_iss' => number_format($pr->perc_iss, 2),
                            'perc_ipi' => number_format($pr->perc_ipi, 2),
                            'CST_COFINS' => $pr->CST_COFINS,
                            'perc_cofins' => number_format($pr->perc_cofins, 2),
                            'descricao_anp' => $pr->descricao_anp ?? '',
                            'codigo_anp' => number_format($pr->codigo_anp, 2),
                            'codBarras' => $pr->codBarras,
                            'cListServ' => $pr->cListServ
                        ]);
                    }

                    $data = [
                        'lastId' => ($this->nfe_model->getAllLastNumbers()->ultimo_num_nfe == null) ? 1 : $this->nfe_model->getAllLastNumbers()->ultimo_num_nfe,
                        'cpf' => '',
                        'cliente' => [
                            'cidade' => [
                                'codigo' => $this->returnApiProps('/get_issuer')->codMun,
                                'nome' => $customer->name,
                                'uf' => $customer->state,
                                'cep' => $customer->cep,
                            ],
                            'consumidor_final' => $customer->consumidor_final,
                            'razao_social' => $customer->company,
                            'ie_rg' => $customer->ie_rg,
                            'rua' => $customer->rua,
                            'numero' => $customer->rua,
                            'bairro' => $customer->bairro,
                            'contribuinte' => $customer->contribuinte,
                            'cep' => $customer->cep,
                            'cpf_cnpj' => $customer->cpf_cnpj
                        ],
                        'nome' => '',
                        'produtos' => $products,
                        'desconto' => 0,
                        'valor_total' => $sale->total,
                        'troco' => 0,
                        'tipo_pagamento' => $sale->tipo_pagamento,
                        'frete' => $frete,
                        'transportadora' => '',
                        'forma_pagamento' => $sale->payment_method,
                        'quantidades' => $sale->quantidades,
                        'observacao' => '',
                        'natureza' => [
                            "natureza" => $sale->natureza,
                            "CFOP_entrada_estadual" => $this->returnApiProps('/get_nature_configs')[0]->CFOP_entrada_estadual,
                            "CFOP_entrada_inter_estadual" => $this->returnApiProps('/get_nature_configs')[0]->CFOP_entrada_inter_estadual,
                            "CFOP_saida_estadual" => $this->returnApiProps('/get_nature_configs')[0]->CFOP_saida_estadual,
                            "CFOP_saida_inter_estadual" => $this->returnApiProps('/get_nature_configs')[0]->CFOP_saida_inter_estadual,
                        ],
                        'estado' => $sale->estado
                    ];

                    $ch = curl_init();
                    curl_setopt($ch, CURLOPT_URL,$this->api_url . '/generate_nf');
                    curl_setopt($ch, CURLOPT_POST, 1);
                    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

                    $res = json_decode(curl_exec($ch));

                    $recibo = $res->nf;
                    $retorno = substr($recibo, 0, 4);
                    $mensagem = substr($recibo, 5, strlen($recibo));

                    if($retorno == 'Erro') {
                        $m = (object)json_decode($mensagem);

                        $this->sales_model->upSale($sale->id, [
                            'estado' => $res->data->estado
                        ]);

                        echo '
                            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                            <script>
                                window.onload = function() {
                                    swal("Erro ao gerar NF!", "[ '. $m->protNFe->infProt->cStat .' ] :  '. $m->protNFe->infProt->xMotivo . ' \n" , "error").then(()=>{
                                        window.close();
                                    });
                                };
                            </script>
                        ';

                    } else if($res == 'Apro'){
                        echo '
                            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                            <script>
                                window.onload = function() {
                                    swal("Cuidado!", "Esta NF já esta aprovada, não é possível enviar novamente!" , "warning").then(()=>{
                                        window.close();
                                    });
                                };
                            </script>
                        ';
                    } else if($res->error) {
                        echo '
                            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                            <script>
                                window.onload = function() {
                                    swal("Erro!", "Erro interno do servidor!" , "error").then(()=>{
                                        window.close();
                                    });
                                };
                            </script>
                        ';
                    } else {
                        $this->sales_model->upSale($sale->id, [
                            'chave' => $res->data->chave,
                            'estado' => $res->data->estado,
                            'nfNumero' => $res->data->nfNumero
                        ]);

                        $this->nfe_model->updateLastNumber([
                            'ultimo_num_nfe' => $res->data->nfNumero
                        ]);

                        echo '
                            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                            <script>
                                window.onload = function() {
                                  swal("Sucesso", "NF-e gerada com sucesso RECIBO: '.$recibo.'", "success").then(() => {
                                      window.location.href = window.location.origin + "/generate/danfe/?val[]='.$sale->id.'";
                                  });
                                };                            
                            </script>
                        ';
                    }
                } else {
                    echo '
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Cuidado!", "Esta NF já esta aprovada, não é possível enviar novamente!" , "warning").then(()=>{
                                    window.close();
                                });
                            };
                        </script>';
                }

            } else {
                echo '
                    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script>
                        window.onload = function() {
                          swal("Erro ao gerar NF!", "Selecione uma venda para gerar a NF \n (selecione uma única venda)", "error").then(() => {
                              window.close();
                          });
                        };                            
                    </script>
                ';
            }
        } else {
            echo '
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    window.onload = function() {
                        swal("Erro ao gerar NF!", "Selecione uma venda para gerar a NF \n (selecione uma única venda)", "error").then(()=>{
                            window.close();
                        });
                    };
                </script>
            ';
        }
    }

    public function consultarNfe()
    {
        if(isset($this->get->val)) {
            if(count($this->get->val) == 1) {
                $sale = $this->sales_model->getSale($this->get->val[0]);
                $chave = $sale->chave ?? '';
                $res = $this->returnApiProps('/consult_nfe', ['chave' => $chave]);

                if(!$res->error) {
                    $js = (object)json_decode($res);

                    if($js->cStat != '656') {
                        echo '
                            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                            <script>
                                window.onload = function() {
                                    swal("Sucesso", "Status: ' . $js->xMotivo . '\n\nChave: ' . $js->chNFe . '\n\nProtocolo: '. $js->protNFe->infProt->nProt . '" , "success").then(()=>{
                                        window.close();
                                    });
                                };
                            </script>
                        ';
                    } else {
                        echo '
                            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                            <script>
                                window.onload = function() {
                                    swal("Erro", "Consumo indevido", "error").then(()=>{
                                        window.close();
                                    });
                                };
                            </script>
                        ';
                    }
                } else {
                    echo '
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Erro ao consultar NF-e!", "'.$res->message.'", "error").then(()=>{
                                    window.close();
                                });
                            };
                        </script>
                    ';
                }
            } else {
                echo '
                    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script>
                        window.onload = function() {
                            swal("Erro ao consultar NFe!", "Selecione uma venda para consultar a NFe \n (selecione uma única venda)", "error").then(()=>{
                                window.close();
                            });
                        };
                    </script>
                ';
            }
        } else {
            echo '
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    window.onload = function() {
                        swal("Erro ao consultar NFe!", "Selecione uma venda para consultar a NFe \n (selecione uma única venda)", "error").then(()=>{
                            window.close();
                        });
                    };
                </script>
            ';
        }
    }

    public function justifyCancel()
    {
        if(isset($this->get->val)) {
            if(count($this->get->val) == 1) {
                $sale = $this->sales_model->getSale($this->get->val[0]);
                $data = [
                    'chave' => $sale->chave ?? '',
                    'justificativa' => $this->get->justificativa_cancelar ?? ''
                ];

                if(empty($data['chave'])) {
                    die('
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Erro ao cancelar NFe!", "Chave inválida", "error").then(()=>{
                                    window.close();
                                });
                            };
                        </script>
                    ');
                }

                if(empty($data['justificativa']) || strlen($data['justificativa']) < 15) {
                    die('
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Erro ao cancelar NFe!", "Justificativa inválida. O campo justificativa não pode ser nulo e deve possuir mais de 15 caracteres", "error").then(()=>{
                                    window.close();
                                });
                            };
                        </script>
                    ');
                }

                if($sale->estado == 'CANCELADA') {
                    die('
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Cuidado!", "NF-e já cancelada anteriormente. \nNão é possível cancelar novamente", "warning").then(()=>{
                                    window.close();
                                });
                            };
                        </script>
                    ');
                }

                $res = $this->returnApiProps('/cancel_nfe', $data);

                if(!$res->error) {

                    $this->sales_model->upSale($sale->id, [
                        'estado' => 'CANCELADA'
                    ]);

                    if($this->nfe_model->getAllLastNumbers()->ultimo_num_cancela != null) {
                        $this->nfe_model->updateLastNumber([
                            'ultimo_num_cancela' => $this->nfe_model->getAllLastNumbers()->ultimo_num_cancela + 1
                        ]);
                    } else {
                        $this->nfe_model->updateLastNumber([
                            'ultimo_num_cancela' => 1
                        ]);
                    }

                    echo '
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Sucesso", "Nf-e cancelada com sucesso!", "success").then(()=>{
                                    window.close();
                                });
                            };
                        </script>
                    ';
                }
            } else {
                echo '
                    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script>
                        window.onload = function() {
                            swal("Erro ao cancelar NFe!", "Selecione uma venda para cancelar a NFe \n (selecione uma única venda)", "error").then(()=>{
                                window.close();
                            });
                        };
                    </script>
                ';
            }
        } else {
            echo '
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    window.onload = function() {
                        swal("Erro ao cancelar NFe!", "Selecione uma venda para cancelar a NFe \n (selecione uma única venda)", "error").then(()=>{
                            window.close();
                        });
                    };
                </script>
            ';
        }
    }

    public function fixNfe()
    {
        parse_str($this->get->node_values_correcao, $val);
        $this->get->val = $this->toJson($val)->val;
        if(isset($this->get->val)) {
            if(count($this->get->val) == 1) {
                $sale = $this->sales_model->getSale($this->get->val[0]);

                $data = [
                    'chave' => $sale->chave ?? '',
                    'sequencia_cce' => $sale->sequencia_cce ?? 1,
                    'correcao' => $this->get->correcao,
                ];

                if(empty($data['correcao']) || strlen($data['correcao']) < 15) {
                    die('
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Erro ao corrigir NFe!", "Correção inválida. O campo correção não pode ser nulo e deve possuir mais de 15 caracteres", "error").then(()=>{
                                    window.close();
                                });
                            };
                        </script>
                    ');
                }

                if($sale->estado == 'CANCELADA') {
                    die('
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Cuidado!", "NF-e está cancelada. \nNão é possível corrigir.", "warning").then(()=>{
                                    window.close();
                                });
                            };
                        </script>
                    ');
                }

                $res = $this->returnApiProps('/fix_nfe', $data);

                if(!$res->error) {
                    $this->sales_model->upSale($sale->id, [
                        'sequencia_cce' => ($sale->sequencia_cce != null ) ? $sale->sequencia_cce + 1 : 1
                    ]);

                    die('
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Sucesso", "Correção enviada com sucesso", "success").then(()=>{
                                    window.location.href = window.location.origin + "/print/cce/?sequencia_cce='. ((int)$sale->sequencia_cce + 1) .'&chave='.$sale->chave.'";
                                });
                            };
                        </script>
                    ');
                } else {
                    die('
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Erro", "Erro de comunicação contate o desenvolvedor!", "error").then(()=>{
                                    window.close();
                                });
                            };
                        </script>
                    ');
                }
            } else {
                echo '
                    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script>
                        window.onload = function() {
                            swal("Erro ao corrigir NFe!", "Selecione uma venda para corrigir a NFe \n (selecione uma única venda)", "error").then(()=>{
                                window.close();
                            });
                        };
                    </script>
                ';
            }
        } else {
            echo '
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    window.onload = function() {
                        swal("Erro ao corrigir NFe!", "Selecione uma venda para corrigir a NFe \n (selecione uma única venda)", "error").then(()=>{
                            window.close();
                        });
                    };
                </script>
            ';
        }
    }

    public function printCce()
    {
        if(isset($this->get->val)) {
            if(count($this->get->val) == 1) {
                $sale = $this->sales_model->getSale($this->get->val[0]);

                $data = [
                    'sequencia_cce' => $sale->sequencia_cce,
                    'chave' => $sale->chave,
                    'api_token' => $this->api_token
                ];

                $res = $this->returnApiProps('/print_cce', $data);

                if(!$res->error) {
                    $ch = curl_init($this->api_url . '/print_cce/?' . http_build_query($data));
                    curl_setopt_array($ch,[
                        CURLOPT_SSL_VERIFYPEER => false,
                        CURLOPT_CUSTOMREQUEST => "GET",
                        CURLOPT_RETURNTRANSFER => true,
                    ]);

                    header('Content-type: application/pdf');
                    echo curl_exec($ch);
                } else {
                    echo '
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Erro ao imprimir Cc-e!", "'.$res->message.'", "error").then(()=>{
                                    window.close();
                                });
                            };
                        </script>
                    ';
                }
            } else {
                echo '
                    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script>
                        window.onload = function() {
                            swal("Erro ao imprimir Cc-e!", "Selecione uma única venda para imprimir o Cce", "error").then(()=>{
                                window.close();
                            });
                        };
                    </script>
                ';
            }
        } else if(isset($this->get->sequencia_cce)) {

            $data = [
                'sequencia_cce' => $this->get->sequencia_cce,
                'chave' => $this->get->chave,
                'api_token' => $this->api_token
            ];

            $res = $this->returnApiProps('/print_cce', $data);

            if(!$res->error) {
                $ch = curl_init($this->api_url . '/print_cce/?' . http_build_query($data));
                curl_setopt_array($ch,[
                    CURLOPT_SSL_VERIFYPEER => false,
                    CURLOPT_CUSTOMREQUEST => "GET",
                    CURLOPT_RETURNTRANSFER => true,
                ]);

                header('Content-type: application/pdf');
                echo curl_exec($ch);
            } else {
                echo '
                    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script>
                        window.onload = function() {
                            swal("Erro ao imprimir Cc-e!", "'.$res->message.'", "error").then(()=>{
                                window.close();
                            });
                        };
                    </script>
                ';
            }
        } else {
            echo '
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    window.onload = function() {
                        swal("Erro ao imprimir CCe!", "Selecione uma venda para imprimir o CCe \n (selecione uma única venda)", "error").then(()=>{
                            window.close();
                        });
                    };
                </script>
            ';
        }
    }

    public function downloadXml()
    {
        if(isset($this->get->val)) {
            if(count($this->get->val) == 1) {
                $sale = $this->sales_model->getSale($this->get->val[0]);

                $ch = curl_init($this->api_url . '/download_xml/?' . http_build_query(['chave' => $sale->chave]));
                curl_setopt_array($ch, [
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_SSL_VERIFYPEER => false,
                    CURLOPT_CUSTOMREQUEST => "GET"
                ]);

                $res = curl_exec($ch);

                if(!$sale->chave) {
                    die(
                        '
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Erro ao baixar xml!", "O XML ainda não foi gerado, para gerar o XML é necessário enviar a venda", "error").then(()=>{
                                    window.close();
                                });
                            };
                        </script>
                        '
                    );
                }

                if(!$res->error) {
                    echo '
                        <script>
                            window.location.href = "'.$this->api_url.'" + "/download_xml/?'.http_build_query(['chave' => $sale->chave]).'";
                        </script>
                    ';
                } else {
                    echo '
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Erro ao baixar xml!", "'.$res->message.'", "error").then(()=>{
                                    window.close();
                                });
                            };
                        </script>
                    ';
                }
            } else if(count($this->get->val) > 1){
                $xml_to_download = [];

                foreach($this->get->val as $id) {
                    $sale = $this->sales_model->getSale($id);

                    array_push($xml_to_download, [
                        'chave' => $sale->chave
                    ]);
                }

                $ch = curl_init($this->api_url . '/download_xml_zip/?' . http_build_query(['xmls' => $xml_to_download]));
                curl_setopt_array($ch, [
                    CURLOPT_CUSTOMREQUEST => "GET",
                    CURLOPT_SSL_VERIFYPEER => false,
                    CURLOPT_RETURNTRANSFER => true,
                ]);
                $res = curl_exec($ch);

                if(!$res->error) {
                    echo '
                        <script>
                            window.location.href = "'.$this->api_url.'" + "/download_xml_zip/?'.http_build_query([
                                'xmls' => $xml_to_download,
                                'api_token' => $this->api_token
                            ]).'";
                        </script>
                    ';
                } else {
                    echo '
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Erro ao baixar xml!", "'.$res->message.'", "error").then(()=>{
                                    window.close();
                                });
                            };
                        </script>
                    ';
                }

            } else {
                echo '
                    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script>
                        window.onload = function() {
                            swal("Erro ao baixar NFe!", "Selecione uma venda para baixar o XML", "error").then(()=>{
                                window.close();
                            });
                        };
                    </script>
                ';
            }
        } else {
            echo '
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    window.onload = function() {
                        swal("Erro ao baixar NFe!", "Selecione uma venda para baixar NFe \n (selecione uma única venda)", "error").then(()=>{
                            window.close();
                        });
                    };
                </script>
            ';
        }
    }

    public function printCancel()
    {
        if(isset($this->get->val)) {
            if(count($this->get->val) == 1) {
                $sale = $this->sales_model->getSale($this->get->val[0]);
                $data = [
                    'estado' => $sale->estado,
                    'chave' => $sale->chave
                ];

                $ch = curl_init($this->api_url . '/print_cancel/?' . http_build_query($data));
                curl_setopt_array($ch, [
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_CUSTOMREQUEST => "GET",
                    CURLOPT_SSL_VERIFYPEER => false
                ]);

                $res = (object)json_decode(curl_exec($ch));

                if(!$res->error) {
                    header('Content-type: application/pdf');

                    $ch = curl_init($this->api_url . '/print_cancel/?' . http_build_query($data));
                    curl_setopt_array($ch, [
                            CURLOPT_RETURNTRANSFER => true,
                            CURLOPT_CUSTOMREQUEST => "GET",
                            CURLOPT_SSL_VERIFYPEER => false
                    ]);

                    echo curl_exec($ch);
                } else {
                    echo '
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Erro ao imprimir cancela!", "'.$res->message.'", "error").then(()=>{
                                    window.close();
                                });
                            };
                        </script>
                    ';
                }
            } else {
                echo '
                    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script>
                        window.onload = function() {
                            swal("Erro ao imprimir cancela!", "Selecione uma venda para imprimir a cancela\n (selecione uma única venda)", "error").then(()=>{
                                window.close();
                            });
                        };
                    </script>
                ';
            }
        } else if(isset($this->get->chave)){

            $data = [
                'estado' => $this->get->estado,
                'chave' => $this->get->chave
            ];

            $ch = curl_init($this->api_url . '/print_cancel/?' . http_build_query($data));
            curl_setopt_array($ch, [
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_CUSTOMREQUEST => "GET",
                CURLOPT_SSL_VERIFYPEER => false
            ]);
            $res = (object)json_decode(curl_exec($ch));

            if(!$res->error) {
                header('Content-type: application/pdf');
                $ch = curl_init($this->api_url . '/print_cancel/?' . http_build_query($data));
                curl_setopt_array($ch, [
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_CUSTOMREQUEST => "GET",
                    CURLOPT_SSL_VERIFYPEER => false
                ]);
                echo curl_exec($ch);
            } else {
                echo '
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Erro ao baixar NFe!", "'.$res->message.'", "error").then(()=>{
                                    window.close();
                                });
                            };
                        </script>
                    ';
            }
        } else {
            echo '
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    window.onload = function() {
                        swal("Erro ao imprimir cancela", "Selecione uma venda para imprimir a cancela\n (selecione uma única venda)", "error").then(()=>{
                            window.close();
                        });
                    };
                </script>
            ';
        }
    }

    public function disableNfe()
    {
        if(isset($this->get->nfe_inicial) && isset($this->get->nfe_final)) {
            if(isset($this->get->justificativa_inutilizar) && strlen($this->get->justificativa_inutilizar) >= 15) {
                $data = [
                    'nInicio' => $this->get->nfe_inicial,
                    'nFinal' => $this->get->nfe_final,
                    'justificativa' => $this->get->justificativa_inutilizar
                ];

                $res = $this->returnApiProps('/disable_nfe', $data);

                if(!$res->error) {
                    echo '
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("", "['.$res->infInut->cStat . ']\n\n' . $res->infInut->xMotivo.'", "info").then(()=>{
                                    window.close();
                                });
                            };
                        </script>
                    ';
                } else {
                    echo '
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                            window.onload = function() {
                                swal("Erro ao inutilizar NF-e!", "'.$res->message.'", "error").then(()=>{
                                    window.close();
                                });
                            };
                        </script>
                    ';
                }
            } else {
                echo '
                    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script>
                        window.onload = function() {
                            swal("Erro ao inutilizar NF-e!", "É necessário informar uma justificativa para inultilizar a NF-e. A justificativa deve ter no mínimo 15 caracteres", "error").then(()=>{
                                window.close();
                            });
                        };
                    </script>
                ';
            }
        } else {
            echo '
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    window.onload = function() {
                        swal("Erro ao inutilizar NF-e!", "Os campos referentes aos números da NF-e devem ser preenchidos", "error").then(()=>{
                            window.close();
                        });
                    };
                </script>
            ';
        }
    }

    public function sendNfeXml()
    {
        if (isset($this->get->val)) {
            $salesToPdf = [];
            foreach($this->get->val as $id) {

                $sale = $this->sales_model->getSale($id);

                array_push($salesToPdf, [
                    'chave' => $sale->chave,
                    'data_registro' => $sale->date,
                    'NfNumero' => $sale->nfNumero,
                    'valor_total' => $sale->grand_total
                ]);
            }

            $ch = curl_init($this->api_url . "/send_nfe_xml/?" . http_build_query(['sales_to_pdf' => $salesToPdf]));
            curl_setopt_array($ch, [
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_CUSTOMREQUEST => "GET",
                CURLOPT_SSL_VERIFYPEER => false
            ]);

            $res = json_decode(curl_exec($ch));

            if($res->error) {
                echo '
                    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script>
                        window.onload = function() {
                            swal("Erro ao baixar xml", "'.$res->message.'", "error").then(()=>{
                                window.close();
                            });
                        };
                    </script>
                ';

            } else {
                echo '
                    <script>
                        window.location.href = "'.$this->api_url.'" + "/send_nfe_xml/?'.http_build_query(['sales_to_pdf' => $salesToPdf]).'";
                    </script>
                ';
            }

        } else {
            echo '
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    window.onload = function() {
                        swal("Erro ao baixar xml", "Selecione uma venda para envivar o xml", "error").then(()=>{
                            window.close();
                        });
                    };
                </script>
            ';
        }
    }

    public function printNfce()
    {
        if(isset($this->get->chave)) {
            $data = [
                'api_token' => $this->api_token,
                'chave' => $this->get->chave
            ];

            $ch = curl_init($this->api_url . '/print_nfce/?' . http_build_query($data));
            curl_setopt_array($ch, [
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_CUSTOMREQUEST => "GET",
                CURLOPT_SSL_VERIFYPEER => false
            ]);

            $res = curl_exec($ch);

            if(!$res->error) {
                $this->nfe_model->truncate('products_nfe');

                header('Content-type: application/pdf');

                $ch = curl_init($this->api_url . '/print_nfce/?' . http_build_query($data));
                curl_setopt_array($ch, [
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_CUSTOMREQUEST => "GET",
                    CURLOPT_SSL_VERIFYPEER => false
                ]);

                echo curl_exec($ch);
            } else {
                echo '
                    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script>
                        window.onload = function() {
                            swal("Erro ao imprimir NFCe", "'.$res->message.'", "error").then(()=>{
                                window.close();
                            });
                        };
                    </script>
                ';
            }
        } else {
            echo '
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    window.onload = function() {
                        swal("Erro ao imprimir NFCe", "Chave não informada", "error").then(()=>{
                            window.close();
                        });
                    };
                </script>
            ';
        }
    }

    public function getNFce()
    {
        $lastId = $this->get->sale_id ?? $this->sales_model->getLastSaleId();

        $data = [
            'lastId' => ($this->nfe_model->getAllLastNumbers()->ultimo_num_nfce == null) ? 1 : $this->nfe_model->getAllLastNumbers()->ultimo_num_nfce,
            'cpf' => $this->input->post('cpf') ?? null,
            'nome' => '',
            'cliente' => [
                'cidade' => [
                    'uf' => ''
                ]
            ],
            'produtos' => $this->nfe_model->getAll(),
            'desconto' => $this->sales_model->getSale($lastId)->order_discount,
            'valor_total' => $this->sales_model->getSale($lastId)->grand_total,
            'valor_pago' => $this->get->valor_pago,
            'troco' => $this->get->troco ?? 0,
            'tipo_pagamento' => $this->nfe_model->getAll()[0]->payment_method,
            'estado' => $this->sales_model->getSale($lastId)->estado,
            'natureza' => [
                "natureza" => $this->returnApiProps('/get_issuer')->nat_op_padrao,
                "CFOP_entrada_estadual" => $this->returnApiProps('/get_nature_configs')[0]->CFOP_entrada_estadual,
                "CFOP_entrada_inter_estadual" => $this->returnApiProps('/get_nature_configs')[0]->CFOP_entrada_inter_estadual,
                "CFOP_saida_estadual" => $this->returnApiProps('/get_nature_configs')[0]->CFOP_saida_estadual,
                "CFOP_saida_inter_estadual" => $this->returnApiProps('/get_nature_configs')[0]->CFOP_saida_inter_estadual,
            ]
        ];

//        echo "<pre>";
//        print_r($data);
//        die;

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,$this->api_url . '/generate_nfce');
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        $res = json_decode(curl_exec($ch));

        $recibo = $res->json;
        $retorno = substr($recibo, 0, 4);
        $mensagem = substr($recibo, 5, strlen($recibo));

        if(!$res->data->error) {
            if($retorno == 'Erro') {
                $m = (object)json_decode($mensagem);

                $this->sales_model->upSale($lastId, [
                    'estado' => $res->data->estado
                ]);

                echo '
                    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script>
                        window.onload = function() {
                            swal("Erro ao gerar NF!", "[ '. $m->protNFe->infProt->cStat .' ] :  '. $m->protNFe->infProt->xMotivo . ' \n" , "error").then(()=>{
                                window.close();
                            });
                        };
                    </script>
                ';
            } else if($retorno == 'erro') {
                echo '
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    window.onload = function() {
                        swal("Erro ao gerar NF!", "WebService sefaz em manutenção, falha de comunicação SOAP" , "error").then(()=>{
                            window.close();
                        });
                    };
                </script>
            ';
            } else if($res == 'Apro') {

                echo '
                    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script>
                        window.onload = function() {
                            swal("Cuidado", "Esta NF já esta aprovada, não é possível enviar novamente!", "warning").then(()=>{
                                window.close();
                            });
                        };
                    </script>
                ';
            } else {

                $this->sales_model->upSale($lastId, [
                    'estado' => $res->data->estado,
                    'chave' => $res->data->chave,
                    'nfcNumero' => $res->nfcNum
                ]);

                $this->nfe_model->updateLastNumber([
                    'ultimo_num_nfce' => (int)$data['lastId']+1
                ]);

                $this->nfe_model->truncate('products_nfe');

                echo '
                    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script>
                        window.onload = function() {
                            swal("Sucesso", "NFCe gerada com sucesso RECIBO: '.$recibo.'", "success").then(()=>{
                                window.location.href = window.location.origin + "/print/nfce/?chave='.$res->data->chave.'";
                            });
                        };
                    </script>
                ';
            }
        } else {

            echo '
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    window.onload = function() {
                        swal("Algo errado", "Erro ao enviar NFC-e", "error").then(()=>{
                            window.close();
                        });
                    };
                </script>
            ';
        }
    }

    public function saveLastNumbers()
    {
        $this->nfe_model->updateLastNumber([
            'num_serie_nfe' => $this->input->post('numero_serie_nfe') ?? $this->nfe_model->getAllLastNumbers()->num_serie_nfe,
            'num_serie_nfce' => $this->input->post('numero_serie_nfce') ?? $this->nfe_model->getAllLastNumbers()->num_serie_nfce,
            'ultimo_num_nfe' => $this->input->post('ultimo_numero_nfe') ?? $this->nfe_model->getAllLastNumbers()->ultimo_num_nfe,
            'ultimo_num_nfce' => $this->input->post('ultimo_numero_nfce') ?? $this->nfe_model->getAllLastNumbers()->ultimo_num_nfce,
            'ultimo_num_cte' => $this->input->post('ultimo_numero_cte') ?? $this->nfe_model->getAllLastNumbers()->ultimo_num_cte,
            'ultimo_num_mdfe' => $this->input->post('ultimo_numero_mdfe') ?? $this->nfe_model->getAllLastNumbers()->ultimo_num_mdfe,
            'ultimo_num_cancela' => $this->input->post('ultimo_num_cancela') ?? $this->nfe_model->getAllLastNumbers()->ultimo_num_cancela
        ]);
    }

    public function generateCupom()
    {
        $sale = $this->get->sale_id ? $this->sales_model->getSale($this->get->sale_id) :
                $this->sales_model->getSale($this->sales_model->getLastSaleId());

        $products_id = explode(",", $sale->id_produtos);
        $products_to_nfce = [];

        foreach($products_id as $id) {
            array_push($products_to_nfce, [true]);
        }

        $data = [
            'id' => $sale->id,
            'itens' => $products_to_nfce,
            'pedido_delivery_id' => 0,
            'valor_total' => $sale->grand_total,
            'dinheiro_recebido' => $sale->paid,
            'troco' => $sale->paid - $sale->grand_total,
            'desconto' => $sale->total_discount,
            'acrescimo' => 0,
            'created_at' => $sale->date,
            'observacao' => $sale->suspend_note,
            'api_token' => $this->api_token
        ];

        $ch = curl_init($this->api_url . '/generate_cupom/?' . http_build_query($data));
        curl_setopt_array($ch, [
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_SSL_VERIFYPEER => false
        ]);

        $res = curl_exec($ch);

        if($res) {
            header("Content-Type: application/pdf");

            $ch = curl_init($this->api_url . '/generate_cupom/?' . http_build_query($data));
            curl_setopt_array($ch, [
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_CUSTOMREQUEST => "GET",
                CURLOPT_SSL_VERIFYPEER => false
            ]);

            echo curl_exec($ch);
        } else {
            die('
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    window.onload = function() {
                        swal("Algo errado", "Erro ao imprimir cupom não fiscal", "error").then(()=>{
                            window.close();
                        });
                    };
                </script>
            ');
        }
    }
}

