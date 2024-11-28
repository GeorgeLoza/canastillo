<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class detalleMovimiento extends Model
{
    use HasFactory;
    protected $fillable = [
        'movimiento_id',
        'item_id',
        'cantidad',
    ];
    public function movimiento()
    {
        return $this->belongsTo(movimiento::class);
    }
    public function item()
    {
        return $this->belongsTo(item::class);
    }
}
