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
        $query = $this->db->insert('products_nfe', $data);

        if (!$query) {
            return $this->db->error();
        }

        return true;
    }

    public function getAll()
    {
        return $this->db->get('products_nfe')->result();
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

    public function truncate($tableName)
    {
        return $this->db->truncate($tableName);
    }
}