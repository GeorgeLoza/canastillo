<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('movimientos', function (Blueprint $table) {
            $table->id();
            $table->string('tiempo');
            $table->foreignId('almacen_id')->constrained()->onDelete('restrict');
            $table->foreignId('user_id')->constrained('users')->onDelete('restrict'); // despachador
            $table->foreignId('transporte_cliente')->constrained('users')->onDelete('restrict')->nullable(); // person responsable
            $table->string('identificador')->nullable(); //numero de comprobante o indicador
            $table->string('movimiento'); //ingreso - egreso
            $table->string('tipo_movimiento'); //compra - depacho - devolucion - baja - ajuste - perdida - traspaso ingreso - traspaso salida
            $table->string('observaciones')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('movimientos');
    }
};
