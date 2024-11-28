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
        $this->users = User::where('rol','cliente')->get();
        $this->items = Item::all();
    }

    public function updatedSelectedUser($userId)
    {
        // Filtrar movimientos por el usuario seleccionado
        $this->movements = Movimiento::with(['detalles', 'detalles.item'])
            ->where('transporte_cliente', $userId)
            ->get()
            ->map(function ($movement) {
                $data = [
                    'fecha' => $movement->created_at->format('Y-m-d'),
                    'identificador' => $movement->identificador,
                    'movimiento' => $movement->movimiento,
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
    $this->totals = []; // Reinicia los totales

    foreach ($this->items as $item) {
        // Inicializa el total para este item
        $this->totals[$item->id] = $this->movements->sum(function ($movement) use ($item) {
            // Asegúrate de que cada movimiento tenga la clave 'movimiento' y 'items'
            $movimiento = $movement['movimiento'] ; // Usar la columna 'movimiento'
            $cantidad = $movement['items'][$item->id];

            logger()->info('Detalles del movimiento', [
                'item_id' => $item->id,
                'movimiento' => $movimiento,
                'cantidad' => $cantidad,
            ]);
        

            if ($movimiento == 'Ingreso') {
                return $cantidad; // Suma para ingresos
            } elseif ($movimiento == 'Egreso') {
                return -$cantidad; // Resta para egresos
            }

            return 0; // Si no es ingreso ni egreso, no afecta el total
        });
    }
   
}
    public function render()
    {

        return view('livewire.consultas.consultausuario');
    }


}
