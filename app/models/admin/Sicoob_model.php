<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Sicoob_model extends CI_Model
{
    public function getAll()
    {
        return $this->db->get('sicoob_configs')->result()[0];
    }

    public function save(array $data)
    {
        $this->db->truncate('sicoob_configs');
        $query = $this->db->insert('sicoob_configs', $data);

        if (!$query)
            return false;

        return true;
    }

    public function checkCustomer($customer_id)
    {
        $customer = $this->db->get_where("companies", ["id" => $customer_id])->result()[0];

        if(! $customer->vat_no || ! $customer->data_nasc)
            return false;

        if(! $customer->address || ! $customer->bairro)
            return false;

        if(! $customer->city || ! $customer->postal_code)
            return false;

        if(! $customer->state || ! $customer->cod_mun)
            return false;

        if(! $customer->phone || ! $customer->UF)
            return false;

        return true;
    }

    public function getBoletoConfigs( $company_id, $sale_id, $issuer, $chave )
    {
        $customer = $this->db->get_where('companies', ['id' => $company_id] )->result()[0];
        $sale = $this->db->get_where('sales', ['id' => $sale_id] )->result()[0];
        $sicoob = $this->getAll();

        return [
            "numCliente" => $sicoob->num_cliente,
            "coopCartao" => $sicoob->cooperativa,
            "chaveAcessoWeb" => $chave,
            "numContaCorrente" => $sicoob->num_conta_corrente,
            "nomeSacado" => $customer->name,
            "cpfCGC" => $customer->vat_no,
            "dataNascimento" => date("Ymd", strtotime($customer->data_nasc)), // adicionar na tebela
            "endereco" => $customer->address,
            "bairro" => $customer->bairro,
            "cidade" => $customer->city,
            "cep" => $customer->postal_code,
            "uf" => $customer->state,
            "codMunicipio" => $customer->cod_mun, // adicionar na tebela
            "telefone" => $customer->phone,
            "ddd" => $customer->UF,
            "ramal" => "",
            "bolRecebeBoletoEletronico" => 1,
            "email" => $customer->email,
            "numTitulo" => $sale->id,
            "codEspDocumento" => "05",
            "dataEmissao" => date("Ymd"),
            "seuNumero" => $sale->id,
            "valorTitulo" => $sale->grand_total,
            "codTipoVencimento" => 1,
            "dataVencimentoTit" => date("Ymd", strtotime(date("Ymd") . ' + '.$sicoob->venc_em_dias.' days')),
            "dataLimitePagamento" => date("Ymd", strtotime(date("Ymd") . ' + 10 days')),
            "valorAbatimento" => "",
            "valorIOF" => $sicoob->valor_iof,
            "bolAceite" => 0,
            "percTaxaMulta" => $sicoob->perc_juros,
            "percTaxaMora" => $sicoob->perc_taxa_mora,
            "dataMulta" => date("Ymd", strtotime(date("Ymd") . ' + '.$sicoob->multa_em_dias.' days')),
            "dataJuros" => date("Ymd", strtotime(date("Ymd") . ' + '.$sicoob->juros_em_dias.' days')),
            "nomeSacador" => $issuer->razao_social,
            "numCGCCPFSacador" => $issuer->cnpj,
            "dataPrimDesconto" => date("Ymd", strtotime(date("Ymd", strtotime(date("Ymd") . ' + '.$sicoob->venc_em_dias.' days')) . ' - '.$sicoob->data_desc_1.' days')),
            "valorPrimDesconto" => ( $sicoob->valor_desc_1 / 100) * $sale->grand_total,
            "dataSegDesconto" => date("Ymd", strtotime(date("Ymd", strtotime(date("Ymd") . ' + '.$sicoob->venc_em_dias.' days')) . ' - '.$sicoob->data_desc_2.' days')),
            "valorSegDesconto" => ( $sicoob->valor_desc_2 / 100) * $sale->grand_total,
            "dataTerDesconto" => date("Ymd", strtotime(date("Ymd", strtotime(date("Ymd") . ' + '.$sicoob->venc_em_dias.' days')) . ' - '.$sicoob->data_desc_3.' days')),
            "valorTerDesconto" => ( $sicoob->valor_desc_3 / 100) * $sale->grand_total,
            "descInstrucao1" => $sicoob->inst_1,
            "descInstrucao2" => $sicoob->inst_2,
            "descInstrucao3" => $sicoob->inst_3,
            "descInstrucao4" => $sicoob->inst_4,
            "descInstrucao5" => $sicoob->inst_5,
        ];
    }
}