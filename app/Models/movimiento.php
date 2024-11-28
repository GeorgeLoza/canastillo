<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class movimiento extends Model
{
    use HasFactory;
    protected $fillable = [
        'tiempo',
        'almacen_id',
        'user_id',
        'transporte_cliente',
        'identificador',
        'movimiento',
        'tipo_movimiento',
        'observaciones',
    ];
    public function almacen()
    {
        return $this->belongsTo(almacen::class);
    }

    public function despachador()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function transporteCliente()
    {
        return $this->belongsTo(User::class, 'transporte_cliente');
    }

    public function detalles()
    {
        return $this->hasMany(DetalleMovimiento::class);
    }

}
