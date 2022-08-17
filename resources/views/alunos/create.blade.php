@extends('default', ['title' => 'Cadastrar aluno'])
@section('content')

<div class="row">
	<div class="card">
		<div class="card-body">
			<div class="row align-items-center">
				<div class="col-md-8">
					<h3 class="mb-0">Cadastro de aluno</h3>
				</div>
				<div class="col-md-4 text-right">
					<a href="/aluno" class="btn btn-sm btn-primary">Voltar</a>
				</div>
			</div>
		</div>
		<div class="card-body">

			{!!Form::open()
			->post()
			->route('aluno.store')
			->multipart()!!}
			<div class="pl-lg-4">
				@include('alunos._forms')
			</div>
			{!!Form::close()!!}

		</div>
	</div>
</div>
@endsection