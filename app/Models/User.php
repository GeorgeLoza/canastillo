<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'lastname',
        'rol',
        'area',
        'almacen_id',
        'email',
        'login',
        'password',
    ];
    public function almacen()
    {
        return $this->belongsTo(almacen::class);
    }
    public function garantia()
    {
        return $this->hasMany(garantia::class);
    }
    public function informacionExtra()
    {
        return $this->hasOne(informacionExtra::class);
    }
    public function movimientosRealizados()
    {
        return $this->hasMany(Movimiento::class, 'user_id');
    }
    public function movimientosAsignados()
    {
        return $this->hasMany(Movimiento::class, 'transporte_cliente');
    }

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
}
