<?php

namespace App\Livewire\Item;

use App\Models\item;
use Livewire\Component;
use LivewireUI\Modal\ModalComponent;
use Masmerise\Toaster\Toaster;

class Editar extends ModalComponent
{
    public $id;
    public $tipo;
    public $codigo;
    public $tamaño;
    public $precio;
    public $color;
    public $detalle;

    protected $rules = [
        'tipo' => 'required',
        'codigo' => 'required|string|max:10',
        'tamaño' => 'required',
        'precio' => 'nullable',
        'color' => 'nullable',
        'detalle' => 'nullable',
    ];

    public function mount($id)
    {
        $item = item::findOrFail($id);
        $this->id = $item->id;
        $this->tipo = $item->tipo;
        $this->codigo = $item->codigo;
        $this->tamaño = $item->tamaño;
        $this->precio = $item->precio;
        $this->color = $item->color;
        $this->detalle = $item->detalle;
    }

    public function render()
    {
        return view('livewire.item.editar');
    }

    public function save()
    {
        $this->validate();

        try {
            $item = item::findOrFail($this->id);
            $item->update([
                'tipo' => $this->tipo,
                'codigo' => $this->codigo,
                'tamaño' => $this->tamaño,
                'precio' => $this->precio,
                'color' => $this->color,
                'detalle' => $this->detalle,
            ]);

            $this->closeModal();
            $this->dispatch('tablaItem');
            Toaster::success('Item actualizado exitosamente!');
        } catch (\Throwable $th) {
            Toaster::error('Fallo al momento de actualizar el item: ' . $th->getMessage());
        }
    }
    public function cerrar()
    {
        $this->closeModal();
    }
}
