<?php

namespace App\Models;

use CodeIgniter\Model;

class M_product extends Model
{
  public function __construct()
  {
    $this->db = \Config\Database::connect();
  }

  public function getAllData()
  {
    return $this->db->table('product')->get();
  }
}
