<?php

namespace App\Livewire\Item;

use App\Models\item;
use Livewire\Component;
use LivewireUI\Modal\ModalComponent;
use Masmerise\Toaster\Toaster;

class Crear extends ModalComponent
{
     /*inputs */
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

    public function render()
    {
        return view('livewire.item.crear');
    }

    public function save()
    {
        $this->validate();
        try {
            item::create([
                'tipo' => $this->tipo,
                'codigo' => $this->codigo,
                'tamaño' => $this->tamaño,
                'precio' => $this->precio,
                'color' => $this->color,
                'detalle' => $this->detalle,

            ]);
            $this->closeModal();
            $this->dispatch('tablaItem');
            Toaster::success('Item creado exitosamente!');
        } catch (\Throwable $th) {
            Toaster::error('Fallo al momento de crear el item: ' . $th->getMessage());
        }
    }
    public function cerrar()
    {
        $this->closeModal();
    }
}
