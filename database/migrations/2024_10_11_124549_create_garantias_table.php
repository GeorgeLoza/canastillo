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
        Schema::create('garantias', function (Blueprint $table) {
            $table->id();
            $table->dateTime('tiempo'); //fecha - hora
            $table->foreignId('user_id')->constrained()->onDelete('restrict');
            $table->string('movimiento'); //ingreso - egreso
            $table->decimal('monto', 10, 2);
            $table->string('identificador')->nullable(); //numero de comprobante o indicador
            $table->string('observaciones');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('garantias');
    }
};
