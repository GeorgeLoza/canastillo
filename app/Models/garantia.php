<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class garantia extends Model
{
    use HasFactory;
    protected $fillable = [
        'tiempo',
        'user_id',
        'movimiento',
        'monto',
        'identificador',
        'observaciones',
    ];
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
