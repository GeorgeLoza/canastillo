<?php

namespace App\Livewire\User;

use App\Models\almacen;
use App\Models\informacionExtra;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Livewire\Component;
use LivewireUI\Modal\ModalComponent;
use Masmerise\Toaster\Toaster;

class Editar extends ModalComponent
{
    public $id;

    /* Inputs */
    public $name;
    public $lastname;
    public $rol;
    public $almacen_id;
    public $login;
    public $password;
    public $showPassword = false;

    public $telefono;
    public $direccion;
    public $ruta;
    public $placa;

    /* Selects datos */
    public $almacenes;
    /*extras */
    public $mostrarDiv = false;

    protected $rules = [
        'name' => 'required|string|max:255',
        'lastname' => 'required|string|max:255',
        'rol' => 'required'
    ];
    public function mount()
    {
        $this->almacenes = almacen::all();

        // Cargar el usuario y su información adicional
        $usuario = User::findOrFail($this->id);

        $this->name = $usuario->name;
        $this->lastname = $usuario->lastname;
        $this->rol = $usuario->rol;
        $this->almacen_id = $usuario->almacen_id;
        $this->login = $usuario->login;

        // Cargar la información extra si existe
        $infoExtra = informacionExtra::where('user_id', $this->id)->first();
        if ($infoExtra) {
            $this->telefono = $infoExtra->telefono;
            $this->direccion = $infoExtra->direccion;
            $this->ruta = $infoExtra->ruta;
            $this->placa = $infoExtra->placa;
        }
    }



    public function render()
    {
        return view('livewire.user.editar');
    }

    public function save()
    {
        $this->validate();

        try {
            $usuario = User::findOrFail($this->id);
            $usuario->name = $this->name;
            $usuario->lastname = $this->lastname;
            $usuario->rol = $this->rol;
            $usuario->almacen_id = $this->almacen_id;
            $usuario->login = $this->login;

            // Si el campo de la contraseña no está vacío, actualizarla
            if (!empty($this->password)) {
                $usuario->password = Hash::make($this->password);
            }

            $usuario->save();

            // Actualizar la información extra
            $infoExtra = informacionExtra::where('user_id', $this->id)->first();
            if ($infoExtra) {
                $infoExtra->telefono = $this->telefono;
                $infoExtra->direccion = $this->direccion;
                $infoExtra->ruta = $this->ruta;
                $infoExtra->placa = $this->placa;
                $infoExtra->save();
            } else {
                // Crear la información extra si no existe
                informacionExtra::create([
                    'telefono' => $this->telefono,
                    'direccion' => $this->direccion,
                    'ruta' => $this->ruta,
                    'placa' => $this->placa,
                    'user_id' => $this->id,
                ]);
            }

            $this->closeModal();
            $this->dispatch('tablaUsuarios');
            Toaster::success('Usuario actualizado exitosamente!');
        } catch (\Throwable $th) {
            Toaster::error('Fallo al momento de actualizar el usuario: ' . $th->getMessage());
        }
    }
    public function cerrar()
    {
        $this->closeModal();
    }
}
