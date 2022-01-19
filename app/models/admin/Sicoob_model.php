<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Sicoob_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function update($id, $data = [])
    {
        $this->db->where('id', $id);
        if ($this->db->update('sicoob', $data)) {
            return true;
        }
        return false;
    }
}
