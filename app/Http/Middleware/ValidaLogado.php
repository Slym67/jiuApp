<?php

namespace App\Http\Middleware;

use Closure;
use Response;

class ValidaLogado
{

	public function handle($request, Closure $next){

		$value = session('user_logged');
		if(!$value){
			return redirect('/login');
		}
		return $next($request);
		
	}

}