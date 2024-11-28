<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PantallaController extends Controller
{
    public function usuario(){
        return view('pantallas.usuario');
    }
    public function almacen(){
        return view('pantallas.almacen');
    }
    public function baja(){
        return view('pantallas.baja');
    }
    public function compra(){
        return view('pantallas.compra');
    }
    public function despacho(){
        return view('pantallas.despacho');
    }
    public function devolucion(){
        return view('pantallas.devolucion');
    }
    public function inventario(){
        return view('pantallas.inventario');
    }
    public function item(){
        return view('pantallas.item');
    }
    public function perdida(){
        return view('pantallas.perdida');
    }public function traspasoIngreso(){
        return view('pantallas.traspasoIngreso');
    }
    public function traspasoEgreso(){
        return view('pantallas.traspasoEgreso');
    }
    public function garantia(){
        return view('pantallas.garantia');
    }
}
