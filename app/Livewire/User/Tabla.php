<?php

namespace App\Livewire\User;

use App\Models\User;
use Livewire\Attributes\On;
use Livewire\Component;
use Masmerise\Toaster\Toaster;

class Tabla extends Component
{
    public $usuarios;
    #[On('tablaUsuarios')]
    public function mount()
    {
        $this->usuarios = User::all();
    }

    public function render()
    {
        return view('livewire.user.tabla');
    }

    public function delete($id)
    {
        try {
            // Buscar el usuario
            $usuario = User::findOrFail($id);

            // Eliminar la información extra relacionada, si existe
            if ($usuario->informacionExtra) {
                $usuario->informacionExtra->delete();
            }

            // Eliminar el usuario
            $usuario->delete();

            // Actualizar la tabla de usuarios en la interfaz y mostrar el mensaje de éxito
            $this->dispatch('tablaUsuarios');
            Toaster::success('Usuario eliminado exitosamente!');

        } catch (\Throwable $th) {
            // Mostrar mensaje de error en caso de falla
            Toaster::error('Fallo al momento de eliminar el usuario!');
        }
    }

}
