<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Treino;
use App\Models\Cidade;
use App\Models\Agenda;
use App\Models\AlunoTreino;
class PresencaController extends Controller
{
    public function index(Request $request){
        $agenda = Agenda::
        select('agendas.*')
        ->when(!empty($request->cidade_id), function ($q) use ($request) {
            return $q->where('agendas.cidade_id', $request->cidade_id);
        })
        ->when(!empty($request->dia_semana), function ($q) use ($request) {
            return $q->where('agendas.dia_semana', $request->dia_semana);
        })
        ->get();
        $treinos = [];
        foreach($agenda as $a){
            $t = Treino::where('data', $a->date())
            ->where('agenda_id', $a->id)
            ->first();
            
            if($t != null){
                array_push($treinos, $t);
            }

        }
        $cidades = Cidade::all();
        return view('presenca/index', compact('treinos', 'cidades'));

    }

    public function alunos($treino_id){
        $treino = Treino::findOrFail($treino_id);

        return view('presenca/alunos', compact('treino'));

    }

    public function confirmarAluno($aluno_treino_id){
        try{
            $alunoTreino = AlunoTreino::findOrFail($aluno_treino_id);

            $alunoTreino->status = true;
            $alunoTreino->save();
            session()->flash("flash_sucesso", "Presença confirmada do aluno(a) " . $alunoTreino->aluno->nome . " " . $alunoTreino->aluno->sobre_nome);

            return redirect()->back();
        } catch (\Exception $e) {
                // echo $e->getMessage();
                // die;
            session()->flash("flash_erro", "Algo deu errado!");
            return redirect()->back();
        }
    }

    public function alunosPresentes($treino_id){
        $treino = Treino::findOrFail($treino_id);
        return view('presenca/alunos_presentes', compact('treino'));

    }
}
