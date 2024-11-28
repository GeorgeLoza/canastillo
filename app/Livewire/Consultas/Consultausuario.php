<?php

namespace App\Livewire\Consultas;

use Livewire\Component;

use App\Models\User;
use App\Models\Item;
use App\Models\Movimiento;
use App\Models\DetalleMovimiento;

class Consultausuario extends Component
{
    public $users = [];
    public $items = [];
    public $selectedUser = null;
    public $movements = [];
    public $totals = [];

    public function mount()
    {
        // Cargar usuarios e ítems al iniciar
        $this->users = User::all();
        $this->items = Item::all();
    }

    public function updatedSelectedUser($userId)
    {
        // Filtrar movimientos por el usuario seleccionado
        $this->movements = Movimiento::with(['detalles', 'detalles.item'])
            ->where('user_id', $userId)
            ->get()
            ->map(function ($movement) {
                $data = [
                    'fecha' => $movement->created_at->format('Y-m-d'),
                    'identificador' => $movement->identificador,
                    'items' => []
                ];
                foreach ($this->items as $item) {
                    $detalle = $movement->detalles->firstWhere('item_id', $item->id);
                    $data['items'][$item->id] = $detalle ? $detalle->cantidad : 0;
                }
                return $data;
            });

        // Calcular totales
        $this->calculateTotals();
    }

    public function calculateTotals()
    {
        
    }
    public function render()
    {
        
        return view('livewire.consultas.consultausuario');
    }


}
