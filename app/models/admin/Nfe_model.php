<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Nfe_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function saveProductToNfe($data = [])
    {
        return $this->db->insert('products_nfe', $data);
    }

    public function getAll()
    {
        return $this->db->get('products_nfe')->result();
    }

    public function setLastNumNfe($newNumber)
    {
        return $this->db->insert('ultimos_numeros', ['ultimo_num_nfe' => $newNumber]);
    }

    public function getAllLastNumbers()
    {
        return $this->db->get('ultimos_numeros')->result()[0];
    }

    public function updateLastNumber($newValue = [])
    {
        $this->db->where('id', 1);

        return $this->db->update('ultimos_numeros', $newValue);
    }
}