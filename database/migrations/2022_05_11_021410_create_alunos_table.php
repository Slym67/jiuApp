<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAlunosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('alunos', function (Blueprint $table) {
            $table->id();

            $table->string('nome', 30);
            $table->string('sobre_nome', 30);
            $table->string('email', 60);
            $table->string('celular', 20);
            $table->string('sexo', 1);
            $table->boolean('status', 1);
            $table->string('senha', 100);
            $table->string('imagem', 100);
            $table->decimal('peso_atual', 5,2);
            $table->decimal('valor_mensalidade', 8,2);

            $table->boolean('permitir_cadastrar_posicao')->default(false);

            $table->unsignedBigInteger('cidade_id');
            $table->foreign('cidade_id')->references('id')
            ->on('cidades');

            $table->string('token', 200);

            // alter table alunos add column valor_mensalidade decimal(8,2) default 100;
            // alter table alunos add column token varchar(200) default '';
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
        Schema::dropIfExists('alunos');
    }
}
