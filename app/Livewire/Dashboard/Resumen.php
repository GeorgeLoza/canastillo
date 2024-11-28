<?php

namespace App\Livewire\Dashboard;

use App\Models\movimiento;
use Livewire\Component;

class Resumen extends Component
{
    public $movimientos;
    public function mount()
    {
        $this->movimientos = movimiento::with(['detalles.item', 'almacen', 'despachador'])
        ->paginate(10);
    }
    public function render()
    {
        return view('livewire.dashboard.resumen');
    }
}
