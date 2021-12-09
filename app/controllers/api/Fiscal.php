<?php


defined('BASEPATH') or exit('No direct script access allowed');

class Fiscal extends MY_Controller
{
    private $path = "../themes/ats_blue/admin/views/fiscal/";

    private $api_url;

    private $api_token = '$2y$10$k9zHL8kl3ONamH6tSIcF0Oe/WnlPPpBZ5915r3z8IUYdFuR0PDrsC';

    private $post;

    public function __construct()
    {
        parent::__construct();

        $this->post = $this->toJson($_POST);
        $config = new CI_Config();
        $this->api_url = $config->config["api_url"];

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
                'remote_url' => $this->api_url
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

    public function send_requests()
    {
        if(isset($this->post->api_url)) {
            $this->responseJson((array) $this->returnApiProps($this->post->api_url, (array) $this->post));
        } else {
            $this->responseJson(["error" => true, "message" => "Url da api não informada."]);
        }
    }
}
