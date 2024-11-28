<?php

namespace App\Livewire\User;

use App\Models\almacen;
use App\Models\informacionExtra;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Livewire\Component;
use LivewireUI\Modal\ModalComponent;
use Masmerise\Toaster\Toaster;
use PhpParser\Node\Stmt\TryCatch;

class Crear extends ModalComponent
{
    /*inputs */
    public $name;
    public $lastname;
    public $rol;
    public $almacen_id;
    public $login;
    public $password;
    public $showPassword = false; // Nueva propiedad

    public $telefono;
    public $direccion;
    public $ruta;
    public $placa;

    /*Selects datos*/
    public $almacenes;
    /*extras */
    public $mostrarDiv = false;

    public function mount()
    {
        $this->almacenes = almacen::all();
    }

    protected $rules = [
        'name' => 'required|string|max:255',
        'lastname' => 'required|string|max:10',
        'rol' => 'required',
        'login' => 'required',
        'password' => 'required',
    ];

    public function render()
    {
        return view('livewire.user.crear');
    }

    public function save()
    {
        $this->validate();
        try {
            $usuario = User::create([
                'name' => $this->name,
                'lastname' => $this->lastname,
                'rol' => $this->rol,
                'almacen_id' => $this->almacen_id,
                'login' => $this->login,
                'password' => Hash::make($this->password),
            ]);
            informacionExtra::create([
                'telefono' => $this->telefono,
                'direccion' => $this->direccion,
                'placa' => $this->placa,
                'ruta' => $this->ruta,
                'user_id' => $usuario->id,

            ]);
            $this->closeModal();
            $this->dispatch('tablaUsuarios');
            Toaster::success('Usuario creado exitosamente!');
        } catch (\Throwable $th) {
            Toaster::error('Fallo al momento de crear el usuario: ' . $th->getMessage());
        }
    }
    public function cerrar()
    {
        $this->closeModal();
    }
}
