<?php

namespace App\Livewire\Devolucion;

use Livewire\Component;
use App\Models\almacen;
use App\Models\item;
use App\Models\movimiento;
use App\Models\User;
use LivewireUI\Modal\ModalComponent;
use Masmerise\Toaster\Toaster;

class Crear extends ModalComponent
{
    /*inputs*/
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

    protected $rules = [
        'identificador' => 'required',
        'transporte_cliente_id' => 'required',
        'observaciones' => 'nullable',
        'detalles.*.item_id' => 'required|exists:items,id',
        'detalles.*.cantidad' => 'required|numeric|min:1',
    ];
    public function mount()
    {
        $this->almacenes = almacen::all();
        $this->items = item::all();
        $this->transporteClienteLista = User::where('rol','Cliente')->get();
    }
    public function render()
    {
        return view('livewire.devolucion.crear');
    }

    public function addDetalle()
    {
        $this->detalles[] = [
            'item_id' => '',
            'cantidad' => '',
        ];
    }

    public function removeDetalle($index)
    {
        unset($this->detalles[$index]);
        $this->detalles = array_values($this->detalles); // Reindexar el arreglo
    }

    public function save()
    {

        $this->validate();

        try {
               // Crear el movimiento
               $movimiento = Movimiento::create([
                'tiempo' => now(),
                'almacen_id' => auth()->user()->almacen_id,
                'user_id' =>  auth()->user()->id,
                'identificador' => $this->identificador,
                'transporte_cliente' => $this->transporte_cliente_id,
                'movimiento' => $this->movimiento,
                'tipo_movimiento' => $this->tipo_movimiento,
                'observaciones' => $this->observaciones,
            ]);

        // Crear los detalles del movimiento
        foreach ($this->detalles as $detalle) {
            $movimiento->detalles()->create($detalle);
        }

        $this->closeModal();
            $this->dispatch('tablaDevolucion');
            Toaster::success('Devolucion creado exitosamente!');

        } catch (\Throwable $th) {
            Toaster::error('Fallo al momento de crear la devolucion: ' . $th->getMessage());
        }

    }
    public function cerrar()
    {
        $this->closeModal();
    }
}
