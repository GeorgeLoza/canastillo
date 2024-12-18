<?php

namespace App\Livewire\Despacho;

use Livewire\Component;
use App\Models\almacen;
use App\Models\item;
use App\Models\movimiento;
use App\Models\User;
use LivewireUI\Modal\ModalComponent;
use Masmerise\Toaster\Toaster;


class Editar extends ModalComponent
{
    public $id;
    public $almacen_id;
    public $identificador;
    public $transporteClienteLista;
    public $transporte_cliente_id;
    public $movimiento = "Egreso";
    public $tipo_movimiento = "Despacho";
    public $observaciones;

    public $detalles = []; // Arreglo para almacenar los detalles del movimiento

    /*Selects datos*/
    public $almacenes;
    public $items;

    public function mount($id)
    {
        // Cargar la despacho y sus detalles
        $despacho = movimiento::with('detalles')->findOrFail($id);
        $this->transporte_cliente_id = $despacho->transporte_cliente;
        $this->identificador = $despacho->identificador;
        $this->observaciones = $despacho->observaciones;
        $this->detalles = $despacho->detalles->toArray();

        // Cargar ítems y almacenes para los selects
        $this->items = item::all();
        $this->almacenes = almacen::all();
        $this->transporteClienteLista = User::where('rol','Cliente')->get();
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
            'identificador' => 'required',
        'transporte_cliente_id' => 'required',
        'observaciones' => 'nullable',
        'detalles.*.item_id' => 'required|exists:items,id',
        'detalles.*.cantidad' => 'required|numeric|min:1',
        ]);

        try {
            // Actualizar la compra
            $despacho = movimiento::findOrFail($this->id);
            $despacho->update([
                'transporte_cliente' => $this->transporte_cliente_id,
                'identificador' => $this->identificador,
                'observaciones' => $this->observaciones,
                'user_id' =>  auth()->user()->id
            ]);

            // Actualizar los detalles
            $despacho->detalles()->delete(); // Eliminar los detalles actuales
            foreach ($this->detalles as $detalle) {
                $despacho->detalles()->create([
                    'item_id' => $detalle['item_id'],
                    'cantidad' => $detalle['cantidad'],
                ]);
            }
            $this->closeModal();
            $this->dispatch('tablaDespacho');
            Toaster::success('Despacho actualizada exitosamente!');
        } catch (\Throwable $th) {
            Toaster::error('Fallo al momento de editar la despacho: ' . $th->getMessage());
        }
    }

    public function render()
    {
        return view('livewire.despacho.editar');
    }
    public function cerrar()
    {
        $this->closeModal();
    }
}
