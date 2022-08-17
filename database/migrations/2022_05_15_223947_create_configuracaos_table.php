<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateConfiguracaosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('configuracaos', function (Blueprint $table) {
            $table->id();

            $table->decimal('valor_mensalidade', 10, 2);
            $table->integer('dias_para_bloqueio');
            $table->integer('dia_pagamento');
            $table->integer('minutos_para_presenca');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('configuracaos');
    }
}
