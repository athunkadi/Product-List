<?php

namespace App\Controllers;

use CodeIgniter\Controller;
use App\Models\M_product;

class Product extends Controller
{
  public function index()
  {
    $model = new M_product();

    $data = [
      'judul' => 'Data Product',
      'product' => $model->getAllData()
    ];

    echo view('tamplates/v_header');
    echo view('product', $data);
    echo view('tamplates/v_footer');
  }
}
