<?php

namespace App\Http\Middleware;

use Closure;
use Response;
use App\Models\Mensalidade;
use App\Models\Configuracao;
use App\Models\Aluno;

class ValidaPagamento
{

	public function handle($request, Closure $next){

		$value = session('user_logged');
		$aluno = $value['aluno'];

		if(__insMaster($aluno->email)){
			return $next($request);
		}

		$ult = Mensalidade::
		where('aluno_id', $aluno->id)
		->orderBy('id', 'desc')
		->first();

		$aluno = Aluno::findOrFail($aluno->id);
		
		if($aluno->cidade->nome == 'Jaguariaíva'){
			return $next($request);
		}

		if($ult != null){

			$config = Configuracao::first();

			if($config == null){
				return $next($request);
			}

			$dataAtual = date('Y-m-d H:i');
			$dataPagamento = \Carbon\Carbon::parse($ult->data_pagamento)->format('Y-m-d H:i');
			
			$dif = strtotime($dataAtual) - strtotime($dataPagamento);
			$dif = $dif/24/60/60;


			if($dif > $config->dias_para_bloqueio + 30){
				session()->flash("flash_erro", "Acesso bloqueado, realize o pagamento!");
				return redirect('/pagamento');
			}
		}else{

			$dataAtual = date('Y-m-d H:i');
			$dataCadastro = \Carbon\Carbon::parse($aluno->created_at)->format('Y-m-d H:i');

			$dif = strtotime($dataAtual) - strtotime($dataCadastro);
			$dif = (int) $dif/24/60/60;
			if((int)$dif > 30){
				session()->flash("flash_erro", "Acesso bloqueado, realize o pagamento!");
				return redirect('/pagamento');
			}

		}
		
		return $next($request);
		
	}

}