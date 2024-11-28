<?php

namespace App\Livewire\Item;

use App\Models\item;
use Livewire\Attributes\On;
use Livewire\Component;
use Masmerise\Toaster\Toaster;

class Tabla extends Component
{

    public $items;
    #[On('tablaItem')]
    public function mount()
    {
        $this->items = item::all();
    }

    public function render()
    {
        return view('livewire.item.tabla');
    }

    public function delete($id)
    {
        try {
            // Buscar el usuario
            $item = item::findOrFail($id);
            $item->delete();

            // Actualizar la tabla de usuarios en la interfaz y mostrar el mensaje de éxito
            $this->dispatch('tablaItem');
            Toaster::success('El item fue eliminado exitosamente!');

        } catch (\Throwable $th) {
            // Mostrar mensaje de error en caso de falla
            Toaster::error('Fallo al momento de eliminar el item!');
        }
    }

}
