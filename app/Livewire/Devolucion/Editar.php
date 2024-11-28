<?php

namespace App\Livewire\Devolucion;

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
    public $movimiento = "Ingreso";
    public $tipo_movimiento = "Devolucion";
    public $observaciones;

    public $detalles = []; // Arreglo para almacenar los detalles del movimiento

    /*Selects datos*/
    public $almacenes;
    public $items;

    public function mount($id)
    {
        // Cargar la devolucion y sus detalles
        $devolucion = movimiento::with('detalles')->findOrFail($id);
        $this->transporte_cliente_id = $devolucion->transporte_cliente;
        $this->identificador = $devolucion->identificador;
        $this->observaciones = $devolucion->observaciones;
        $this->detalles = $devolucion->detalles->toArray();

        // Cargar ítems y almacenes para los selects
        $this->items = item::all();
        $this->almacenes = almacen::all();
        $this->transporteClienteLista = User::where('rol', 'Cliente')->get();
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
            $devolucion = movimiento::findOrFail($this->id);
            $devolucion->update([
                'transporte_cliente' => $this->transporte_cliente_id,
                'identificador' => $this->identificador,
                'observaciones' => $this->observaciones,
                'user_id' =>  auth()->user()->id
            ]);

            // Actualizar los detalles
            $devolucion->detalles()->delete(); // Eliminar los detalles actuales
            foreach ($this->detalles as $detalle) {
                $devolucion->detalles()->create([
                    'item_id' => $detalle['item_id'],
                    'cantidad' => $detalle['cantidad'],
                ]);
            }
            $this->closeModal();
            $this->dispatch('tablaDevolucion');
            Toaster::success('Devolucion actualizada exitosamente!');
        } catch (\Throwable $th) {
            dd($th);
            Toaster::error('Fallo al momento de editar la devolucion: ' . $th->getMessage());
        }
    }

    public function render()
    {
        return view('livewire.devolucion.editar');
    }
    public function cerrar()
    {
        $this->closeModal();
    }
}
