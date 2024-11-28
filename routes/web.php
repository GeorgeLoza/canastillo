<?php

use App\Http\Controllers\LoginController;
use App\Http\Controllers\PantallaController;
use Illuminate\Support\Facades\Route;



Route::get('/login', [LoginController::class, 'index'])->name('login');
Route::post('/login', [LoginController::class, 'store']);

Route::middleware(['auth'])->group(function () {

    Route::get('/', function () {
        return view('welcome');
    });

    Route::get('/usuario', [PantallaController::class, 'usuario'])->name('usuario.index');
    Route::get('/almacen', [PantallaController::class, 'almacen'])->name('almacen.index');
    Route::get('/baja', [PantallaController::class, 'baja'])->name('baja.index');
    Route::get('/compra', [PantallaController::class, 'compra'])->name('compra.index');
    Route::get('/despacho', [PantallaController::class, 'despacho'])->name('despacho.index');
    Route::get('/devolucion', [PantallaController::class, 'devolucion'])->name('devolucion.index');
    Route::get('/inventario', [PantallaController::class, 'inventario'])->name('inventario.index');
    Route::get('/item', [PantallaController::class, 'item'])->name('item.index');
    Route::get('/perdida', [PantallaController::class, 'perdida'])->name('perdida.index');
    Route::get('/traspadoIngreso', [PantallaController::class, 'traspadoIngreso'])->name('traspadoIngreso.index');
    Route::get('/traspadoEgreso', [PantallaController::class, 'traspadoEgreso'])->name('traspadoEgreso.index');
    Route::get('/garantia', [PantallaController::class, 'garantia'])->name('garantia.index');

    Route::post('/logout', [LoginController::class, 'cerrar'])->name('logout');
});
