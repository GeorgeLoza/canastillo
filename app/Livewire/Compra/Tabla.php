<?php

namespace App\Livewire\Compra;

use App\Models\Movimiento;
use Livewire\Attributes\On;
use Livewire\Component;
use Livewire\WithPagination;
use Masmerise\Toaster\Toaster;

class Tabla extends Component
{
    use WithPagination;

    public $selectedMovimientoId;
    public $selectedDetalleId;
    public $editMode = false;
    public $cantidad;
    public $item;

    public $expandedRow = null; // Guardará el ID del movimiento actualmente expandido

    public function toggleRow($rowId)
    {
        // Si el mismo registro está expandido, lo colapsamos
        if ($this->expandedRow === $rowId) {
            $this->expandedRow = null;
        } else {
            // De lo contrario, expandimos el registro seleccionado
            $this->expandedRow = $rowId;
        }
    }

    #[On('tablaCompra')]
    public function render()
    {
        // Obtenemos los movimientos con sus detalles, usuarios y almacenes
        $movimientos = Movimiento::with(['detalles.item', 'almacen', 'despachador'])->where('tipo_movimiento','Compra')
            ->paginate(10);

        return view('livewire.compra.tabla', [
            'movimientos' => $movimientos,
        ]);
    }

    public function deleteMovimiento($id)
    {

        try {
            // Buscar el usuario
            $movimiento = movimiento::findOrFail($id);
            // Eliminar los registros relacionados en detalle_movimiento
            $movimiento->detalles()->delete();

            // Luego, eliminar el registro en movimiento
            $movimiento->delete();

            // Actualizar la tabla de usuarios en la interfaz y mostrar el mensaje de éxito
            $this->dispatch('tablaCompra');
            Toaster::success('La compra fue eliminado exitosamente!');
        } catch (\Throwable $th) {
            // Mostrar mensaje de error en caso de falla
            Toaster::error('Fallo al momento de eliminar la compra!');
        }
    }
}
