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
}