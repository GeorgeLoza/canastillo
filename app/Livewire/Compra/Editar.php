<?php

namespace App\Livewire\Compra;

use App\Models\almacen;
use App\Models\item;
use App\Models\movimiento;
use LivewireUI\Modal\ModalComponent;
use Masmerise\Toaster\Toaster;

class Editar extends ModalComponent
{
    public $id;
    public $almacen_id;
    public $identificador;
    public $observaciones;
    public $detalles = []; // Detalles de la compra
    public $items = []; // Lista de ítems disponibles
    public $almacenes = []; // Lista de almacenes disponibles

    public function mount($id)
    {
        // Cargar la compra y sus detalles
        $compra = movimiento::with('detalles')->findOrFail($id);
        $this->almacen_id = $compra->almacen_id;
        $this->identificador = $compra->identificador;
        $this->observaciones = $compra->observaciones;
        $this->detalles = $compra->detalles->toArray();

        // Cargar ítems y almacenes para los selects
        $this->items = item::all();
        $this->almacenes = almacen::all();
    }

    public function addDetalle()
    {
        // Agregar un nuevo detalle vacío
        $this->detalles[] = ['item_id' => '', 'cantidad' => 1];
    }

    public function removeDetalle($index)
    {
        // Eliminar el detalle por índice
        unset($this->detalles[$index]);
        $this->detalles = array_values($this->detalles); // Reindexar array
    }

    public function save()
    {
        $this->validate([
            'almacen_id' => 'required|exists:almacens,id',
            'identificador' => 'required|string|max:255',
            'observaciones' => 'nullable|string',
            'detalles.*.item_id' => 'required|exists:items,id',
            'detalles.*.cantidad' => 'required|integer|min:1',
        ]);

        try {
            // Actualizar la compra
            $compra = movimiento::findOrFail($this->id);
            $compra->update([
                'almacen_id' => $this->almacen_id,
                'identificador' => $this->identificador,
                'observaciones' => $this->observaciones,
                'user_id' =>  auth()->user()->id
            ]);

            // Actualizar los detalles
            $compra->detalles()->delete(); // Eliminar los detalles actuales
            foreach ($this->detalles as $detalle) {
                $compra->detalles()->create([
                    'item_id' => $detalle['item_id'],
                    'cantidad' => $detalle['cantidad'],
                ]);
            }
            $this->closeModal();
            $this->dispatch('tablaCompra');
            Toaster::success('Compra actualizada exitosamente!');
        } catch (\Throwable $th) {
            Toaster::error('Fallo al momento de editar la compra: ' . $th->getMessage());
        }
    }

    public function render()
    {
        return view('livewire.compra.editar');
    }
    public function cerrar()
    {
        $this->closeModal();
    }
}
