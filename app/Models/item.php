<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class item extends Model
{
    use HasFactory;
    protected $fillable = [
        'tipo',
        'codigo',
        'tamaño',
        'precio',
        'color',
        'detalle',
    ];
    public function detalle()
    {
        return $this->hasMany(detalleMovimiento::class);
    }
}
