<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class almacen extends Model
{
    use HasFactory;
    protected $fillable = [
        'codigo',
        'nombre',
        'ubicacion',
    ];
    public function user()
    {
        return $this->hasMany(User::class);
    }
    public function movimiento()
    {
        return $this->hasMany(movimiento::class);
    }

}
