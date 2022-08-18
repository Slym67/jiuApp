<?php

namespace App\Http\Middleware;

use Closure;
use Response;

class ValidaAcesso
{
	public function handle($request, Closure $next){
		$value = session('user_logged');

		if($value['master']){
			return $next($request);
		}

		$urip = $_SERVER['REQUEST_URI'];
		$urip = explode("/", $urip);
		$uri = "/".$urip[1];

		if(isset($urip[2])){
			$uri .= "/".$urip[2];
		}

		$uri3 = null;
		if(isset($urip[3])){
			$uri3 = $urip[3];
		}

		$search = false;
		if(str_contains($uri, '?') && str_contains($uri, '&') || $uri3 == "alterarSenha" || str_contains($uri3, 'video_new_manual') || str_contains($uri3, 'newComent')) 
			$search = true;

		$isAccess = $this->rotasPermitidas($uri);
		if($isAccess || $search){
			return $next($request);
		}

		return redirect('/404');
		// die;
		// if($value){
		// 	return redirect('/dashboard');
		// }
	}

	private function rotasPermitidas($uri){
		$rotas = [
			'/posicao',
			'/treino/confirmarPresenca',
			'/posicao/view',
			'/posicao/new',
			'/posicao/store',
			'/agenda',
			'/dashboard',
			'/exames',
			'/perfil',
			'/perfil/salvarFoto',
			'/exames/view',
			'/recompensas/alunos',
			'/aviso/view',
			'/pagamento',
			'/pagamento/pay',
			'/perfil/cronogramaPresenca',
			'/contribuicao',
			'/contribuicao/create'
		];

		if(in_array($uri, $rotas)){
			return true;
		}
		return false;
	}

}