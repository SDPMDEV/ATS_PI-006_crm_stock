<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Sicoob_model extends CI_Model
{
    public function getAll()
    {
        return $this->db->get('sicoob_configs')->result()[0];
    }

    public function getColumnValue($colum)
    {
        return $this->db->select($colum)->get('sicoob_configs')->result()[0]->{$colum};
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

    public function saveBoleto(array $data)
    {
        if($this->db->insert('boletos_sicoob', $data))
            return true;

        return $this->db->error();
    }

    public function getBoletoConfigs( $company_id, $sale_id, $issuer)
    {
        $customer = $this->db->get_where('companies', ['id' => $company_id] )->result()[0];
        $sale = $this->db->get_where('sales', ['id' => $sale_id] )->result()[0];
        $sicoob = $this->getAll();

        $valorCob = $sale->grand_total - (($sicoob->desc_opcional / 100) * $sale->grand_total);
        $valorCob = $valorCob - $sicoob->deducoes;
        $valorCob = $valorCob + ($sicoob->multa_mora / 100) * $sale->grand_total;
        $valorCob = $valorCob + ($sicoob->acres_opcional / 100) * $sale->grand_total;
        $descDemo = [
            str_replace('{venda}', $sale->id, $sicoob->inst1),
            str_replace('{venda}', $sale->id, $sicoob->inst2),
            str_replace('{venda}', $sale->id, $sicoob->inst3),
            str_replace('{venda}', $sale->id, $sicoob->inst4),
        ];

        return [
            'customer_name' => $customer->name,
            'customer_cpfcnpj' => $customer->vat_no,
            'customer_address' => $customer->address,
            'customer_cep' => $customer->postal_code,
            'customer_city' => $customer->city,
            'customer_uf' => $this->getUF($customer->UF),
            'issuer_name' => $issuer->razao_social,
            'issuer_cpfcnpj' => $issuer->cnpj,
            'issuer_address' => $issuer->logradouro,
            'issuer_cep' => $issuer->cep,
            'issuer_city' => $issuer->municipio,
            'issuer_uf' => $issuer->UF,
            'venc_dias' => $sicoob->venc_dias,
            'valor' => $sale->grand_total,
            'agencia' => $sicoob->agencia,
            'conta' => $sicoob->conta,
            'convenio' => $sicoob->convenio,
            'sequencial' => $sale->id,
            'logo_path' => 'https://' . $_SERVER['HTTP_HOST'] . '/assets/uploads/logos/logo3.png',
            'inst' => [
                $sicoob->inst1,
                $sicoob->inst2,
                $sicoob->inst3,
                $sicoob->inst4,
                $sicoob->inst5,
            ],
            'quantidade' => $sale->total_items,
            'num_doc' => $sale->id,
            'mora_multa' => ($sicoob->multa_mora / 100) * $sale->grand_total,
            'especie' => $sicoob->especie,
            'desconto' => ($sicoob->desc_opcional / 100) * $sale->grand_total,
            'outro_acrescimo' => ($sicoob->acres_opcional / 100) * $sale->grand_total,
            'descDemo' => $descDemo,
            'outras_ded' => $sicoob->deducoes,
            'valor_cob' => $valorCob,
            "inst1" => $sicoob->inst1,
            "inst2" => $sicoob->inst2,
            "inst3" => $sicoob->inst3,
            "inst4" => $sicoob->inst4,
            "inst5" => $sicoob->inst5,
            'data_emissao' => new DateTime(),
            'data_vencimento' => date('Y-m-d', strtotime(date('Y-m-d') . ' + ' . $sicoob->venc_dias . ' days'))
        ];
    }

    public function setVencimento($numDoc, $dataVenc)
    {
        $this->db->where('num_doc', $numDoc);

        $this->db->update('boletos_sicoob', [
            'data_vencimento' => $dataVenc
        ]);
    }

    public function getAllEspecies()
    {
        return [
            'DM' => 'Duplicata Mercantil',
            'NP' => 'Nota promissória',
            'NS' => 'Nota de seguro',
            'DS' => 'Duplicata de Serviço',
            'REC' => 'Recibo',
            'LC' => 'Letra de Câmbio',
            'ND' => 'Nota de Débito',
            'BDP' => 'Boleto de Proposta',
            'WR' => 'Warrant',
            'CH' => 'Cheque',
            'CS' => 'Cobrança Seriada',
            'ME' => 'Mensalidade escolar',
            'AS	' => 'Apólice de Seguro',
            'DD' => 'Documento de Dívida',
            'EC' => '	Encargos Condominiais',
            'CPS' => 'Conta de prestação de serviço',
            'CT' => 'Contrato',
            'CSS' => 'Cosseguro',
            'DR' => 'Duplicata Rural',
            'NPR' => 'Nota Promissória Rural',
            'DAU' => 'Dívida Ativa da União',
            'DAE' => 'Dívida Ativa de Estado',
            'DAM' => 'Dívida Ativa de Município',
            'DMI' => 'Duplicata Mercantil por Indicação',
            'DSI' => 'Duplicata de Serviço por Indicação',
            'NCC' => 'Nota de Crédito Comercial',
            'NCE' => 'Nota de Crédito para Exportação',
            'NCI' => 'Nota de Crédito Industrial',
            'NCR' => 'Nota de Crédito Rural',
            'TM' => 'Triplicata Mercantil',
            'TS' => 'Triplicata de Serviço',
            'FAT' => 'Fatura',
            'PC' => 'Parcela de Consórcio',
            'NF' => 'Nota Fiscal',
            'CPR' => 'Cédula de Produto Rural',
            'CC' => 'Cartão de crédito',
            'Outros' => 'Outros',
        ];
    }

    private function getUF($ddd) {
        switch ($ddd) {
            case '68' : return 'AC'; break;
            case '82' : return 'AL'; break;
            case '96' : return 'AP'; break;
            case '92' : return 'AM'; break;
            case '73':
            case '75':
            case '77':
            case '74':
            case '71' : return 'BA'; break;
            case '88':
            case '85' : return 'CE'; break;
            case '61' : return 'DF'; break;
            case '28':
            case '27' : return 'ES'; break;
            case '64':
            case '62' : return 'GO'; break;
            case '99':
            case '98' : return 'MA'; break;
            case '66':
            case '65' : return 'MT'; break;
            case '67' : return 'MS'; break;
            case '32':
            case '34':
            case '37':
            case '35':
            case '33':
            case '38':
            case '31' : return 'MG'; break;
            case '93':
            case '94':
            case '91' : return 'PA'; break;
            case '83' : return 'PB'; break;
            case '42':
            case '44':
            case '43':
            case '46':
            case '45':
            case '41' : return 'PR'; break;
            case '87':
            case '81' : return 'PE'; break;
            case '89':
            case '86' : return 'PI'; break;
            case '22':
            case '24':
            case '21' : return 'RJ'; break;
            case '84' : return 'RN'; break;
            case '55':
            case '53':
            case '51':
            case '54' : return 'RS'; break;
            case '69' : return 'RO'; break;
            case '95' : return 'RR'; break;
            case '49':
            case '48':
            case '47' : return 'SC'; break;
            case '13':
            case '12':
            case '15':
            case '14':
            case '17':
            case '16':
            case '18':
            case '19':
            case '11' : return 'SP'; break;
            case '79' : return 'SE'; break;
            case '63' : return 'TO'; break;
            default : return 'Não informado.'; break;
        }
    }

    public function getAllRemessas()
    {
        return $this->db->get('sma_sicoob_remessas')->result();
    }

    public function saveRemessa(array $data)
    {
        $query = $this->db->get_where('sicoob_remessas', ['nome =' => $data['nome']]);

        if (count($query->result()) > 0)
            return false;

        return $this->db->insert('sma_sicoob_remessas', $data);
    }

    public function getRemessaConfigs($issuer, $company_id, $sale_id)
    {
        $customer = $this->db->get_where('companies', ['id' => $company_id] )->result()[0];
        $sale = $this->db->get_where('sales', ['id' => $sale_id] )->result()[0];
        $sicoob = $this->getAll();
        $boleto = $this->db->get_where('boletos_sicoob', ['sequencial' => $sale_id])->result()[0];

        return [
            'issuer_cnpj' => $issuer->cnpj,
            'agencia' => $sicoob->agencia,
            'agencia_dv' => $sicoob->agencia_dv,
            'conta' => $sicoob->conta,
            'conta_dv' => $sicoob->conta_dv,
            'issuer_name' => $issuer->razao_social,
            'sequencial' => $sale->id,
            'codigo_beneficiario' => $sicoob->codigo_beneficiario,
            'codigo_beneficiario_dv' => $sicoob->codigo_beneficiario_dv,
            'codigo_carteira' => $sicoob->codigo_carteira,
            'valor' => $sale->grand_total,
            'especie' => $sicoob->especie,
            'data_emissao' => $boleto->data_emissao ?? date('Y-m-d'),
            'venc_dias' => $sicoob->venc_dias,
            'mora_multa' => $sicoob->multa_mora,
            'customer_cpfcnpj' => $customer->vat_no,
            'customer_name' => $customer->name,
            'customer_address' => $customer->address,
            'customer_bairro' => $customer->bairro,
            'customer_cep' => $customer->postal_code,
            'customer_city' => $customer->city,
            'customer_uf' => $this->getUF($customer->UF),
            'valor_venc' => $sicoob->valor_venc,
            'inst1' => $sicoob->inst1,
            'inst2' => $sicoob->inst2,
            'inst3' => $sicoob->inst3,
            'inst4' => $sicoob->inst4,
        ];
    }

    public function deleteRemessa($remessaId)
    {
        $this->db->where('id', $remessaId);
        $this->db->delete('sicoob_remessas');
    }

    public function getRemessa($remessaId)
    {
        $query = $this->db->get_where('sicoob_remessas', "id = $remessaId");

        if (! $query)
            return false;

        return $query->result()[0];
    }

    public function updateRemessa($remessaId, $data)
    {
        $this->db->where('id', $remessaId);

        return $this->db->update('sicoob_remessas', $data);
    }

    public function getRemessasDownload()
    {
        $query = $this->db->get_where('sicoob_remessas', ['situacao =' => 'pending']);

        if(! $query)
            return [];

        return $query->result();
    }

    public function getBoleto($id)
    {
        $sicoob = $this->getAll();
        $query = $this->db->get_where('boletos_sicoob', ['sequencial =' => $id]);

        if (empty($query->result()))
            return false;

        $boleto = $query->result()[0];

        unset($sicoob->id);
        foreach ($sicoob as $index => $item) {
            $boleto->{$index} = $item;
        }

        return $boleto;
    }

    public function upRemessa($remessaId, $data)
    {
        $this->db->where('nome', "remessa_$remessaId.REM");

        return $this->db->update('sicoob_remessas', $data);
    }

    public function valorNaoPagos()
    {
        $query = $this->db->get_where('sicoob_remessas', ['situacao =' => 'pending']);

        if (! $query)
            return false;

        $remessas = $query->result();

        $sum = 0;
        foreach ($remessas as $remessa) {
            $sum += $remessa->valor;
        }

        return $sum;
    }

    public function faturaMes()
    {
        $this->db->select('*');
        $this->db->from('sicoob_remessas');
        $this->db->where('data_criacao BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE() AND situacao = "paid" ');

        $query = $this->db->get();

        if (! $query)
            return 0;

        $remessas = $query->result();

        $sum = 0;
        foreach ($remessas as $remessa) {
            $sum += $remessa->valor;
        }

        return $sum;
    }

    public function remessasCount()
    {
        return $this->db->count_all('sicoob_remessas');
    }
}