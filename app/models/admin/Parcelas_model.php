<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Parcelas_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function saveParc($data = [])
    {
        return $this->db->insert('parcelas', $data);
    }

    public function getParcBySale($sale_id)
    {
        $this->db->from('parcelas');
        $this->db->order_by("sale_id", $sale_id);
        $query = $this->db->get();

        if($query) {
            if ($query->num_rows() > 0) {
                return $query->result()[0];
            }
        }

        return false;
    }

    public function deleteParcBySale($sale_id)
    {
        return $this->db->delete('parcelas', ['sale_id' => $sale_id]);
    }
}