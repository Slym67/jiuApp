<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cidade;
use App\Models\Aluno;
use App\Models\Faixa;
use App\Models\Configuracao;
use App\Models\Treino;
use App\Models\AlunoTreino;
use App\Models\AlunoAnotacao;
use App\Models\AlunoGraduacao;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

class AlunoController extends Controller
{

    public function __construct(){

    }

    public function index(Request $request){
        $alunos = Aluno::orderBy('id', 'asc')
        ->select('alunos.*')
        ->when(!empty($request->search), function ($q) use ($request) {
            return  $q->where(function ($quer) use ($request) {
                return $quer->where('nome', 'LIKE', "%$request->search%");
            });
        })
        ->when(!empty($request->cidade_id), function ($q) use ($request) {
            return  $q->where(function ($quer) use ($request) {
                return $quer->where('cidade_id', $request->cidade_id);
            });
        })
        ->when(!empty($request->status), function ($q) use ($request) {
            return  $q->where(function ($quer) use ($request) {
                $status = $request->status == -1 ? 0 : $request->status;
                return $quer->where('status', $status);
            });
        })
        ->when(!empty($request->faixa_id), function ($q) use ($request) {

            return $q->join('aluno_graduacaos', 'aluno_graduacaos.aluno_id', '=', 'alunos.id')
            ->where('aluno_graduacaos.faixa_id', $request->faixa_id);
        })
        ->paginate(getenv("PAGINATE"));

        $count = Aluno::count();
        $countToken = Aluno::
        where('token', '!=', '')
        ->count();
        $faixas = Faixa::allOrder();
        $cidades = Cidade::all();

        return view('alunos/index', compact('alunos', 'cidades', 'faixas', 'count', 'countToken'));
    }

    public function new(){
        $cidades = Cidade::all();
        $faixas = Faixa::allOrder();
        $config = Configuracao::first();
        return view('alunos/create', compact('cidades', 'faixas', 'config'));
    }

    public function editAtivar($id){
        $item = Aluno::findOrFail($id);
        $cidades = Cidade::all();
        $faixas = Faixa::all();
        $ativar = true;
        return view('alunos/edit', compact('cidades', 'faixas', 'item', 'ativar'));
    }

    public function edit($id){
        $item = Aluno::findOrFail($id);
        $cidades = Cidade::all();
        $faixas = Faixa::allOrder();
        return view('alunos/edit', compact('cidades', 'faixas', 'item'));
    }

    public function delete($id){
        $item = Aluno::findOrFail($id);
        
        if(!__insMaster($item->email)){

            try {
                $item->ultimaGraduacao()->delete();
                $item->todosAcessos()->delete();
                $item->todosAcessosPosicoes()->delete();
                $item->views()->delete();
                $item->treinos()->delete();
                $item->checkouts()->delete();
                $item->comentarioVideos()->delete();
                $item->todosPagamento()->delete();
                foreach($item->posicoes as $p){
                    $p->videos()->delete();
                }
                $item->posicoes()->delete();
                $item->delete();
                session()->flash("flash_sucesso", "Registro removido");

                return redirect('/aluno');
            } catch (\Exception $e) {
                // echo $e->getMessage();
                // die;
                session()->flash("flash_erro", "Algo deu errado!");
                return redirect('/aluno');
            }
        }else{
            session()->flash("flash_erro", "Não é possível remover o master!");
            return redirect('/aluno');
        }
    }

    public function deleteDash($id){
        $item = Aluno::findOrFail($id);

        if(!__insMaster($item->email)){

            try {
                $item->ultimaGraduacao()->delete();
                $item->todosAcessos()->delete();
                $item->todosAcessosPosicoes()->delete();
                $item->views()->delete();
                $item->treinos()->delete();
                $item->checkouts()->delete();
                $item->comentarioVideos()->delete();
                $item->todosPagamento()->delete();
                foreach($item->posicoes as $p){
                    $p->videos()->delete();
                }
                $item->posicoes()->delete();

                $item->delete();
                session()->flash("flash_sucesso", "Aluno removido");

                return redirect('/dashboard');
            } catch (\Exception $e) {
                // echo $e->getMessage();
                // die;
                session()->flash("flash_erro", "Algo deu errado!");
                return redirect('/');
            }
        }else{
            session()->flash("flash_erro", "Não é possível remover o master!");
            return redirect('/aluno');
        }
    }

    public function store(Request $request){
        $this->_validate($request);

        $fileName = "";
        if($request->hasFile('file')){
            $file = $request->file('file');

            $fileName = Str::random(20) . "." . $file->getClientOriginalExtension();
            $file->move(public_path('alunos'), $fileName);

        }
        try{
            DB::transaction(function () use ($request, $fileName) {

                $request->merge([
                    'status' => $request->status ? true : false,
                    'imagem' => $fileName,
                    'celular' => preg_replace('/[^0-9]/', '', $request->celular),
                    'senha' => md5($request->senha),
                    'valor_mensalidade' => __replace($request->valor_mensalidade)
                ]);
                $inputs = $request->all();
                $aluno = Aluno::create($inputs);

                AlunoGraduacao::create([
                    'faixa_id' => $request->faixa_id,
                    'aluno_id' => $aluno->id,
                    'grau' => $request->grau,
                    'data' => $request->data_ultima_graduacao
                ]);

            });
            session()->flash("flash_sucesso", "Aluno registrado!");
            return redirect('/aluno');
        }catch(\Exception $e){
            session()->flash("flash_erro", "Algo deu errado!");
            return redirect('/aluno');
        }
    }

    public function update(Request $request, $id){
        $this->_validate($request, $id);
        $item = Aluno::findOrFail($id);

        $fileName = "";
        if($request->hasFile('file')){

            if($item->imagem != ""){
                if(file_exists(public_path('alunos/').$item->imagem)){
                    unlink(public_path('alunos/').$item->imagem);
                }
            }
            $file = $request->file('file');

            $fileName = Str::random(20) . "." . $file->getClientOriginalExtension();
            $file->move(public_path('alunos'), $fileName);

        }
        try{
            DB::transaction(function () use ($request, $fileName, $item) {

                $request->merge([
                    'status' => $request->status ? true : false,
                    'imagem' => $fileName,
                    'celular' => preg_replace('/[^0-9]/', '', $request->celular),
                    'valor_mensalidade' => __replace($request->valor_mensalidade)
                ]);

                if(strlen($request->senha) > 0){
                    $request->merge([
                        'senha' => md5($request->senha)
                    ]);
                }else{
                    $request->merge([
                        'senha' => $item->senha
                    ]);
                }
                $item->fill($request->all())->save();

                $ult = $item->ultimaGraduacao;
                if($ult){

                    $ult->faixa_id = $request->faixa_id;
                    $ult->grau = $request->grau;
                    $ult->data = $request->data_ultima_graduacao;
                    $ult->save();

                }else{
                    AlunoGraduacao::create([
                        'faixa_id' => $request->faixa_id,
                        'aluno_id' => $item->id,
                        'grau' => $request->grau,
                        'data' => $request->data_ultima_graduacao
                    ]);
                }
            });
            session()->flash("flash_sucesso", "Aluno editado!");
            return redirect('/aluno');
        }catch(\Exception $e){
            // echo $e->getMessage();
            // die;            
            session()->flash("flash_erro", "Algo deu errado!");
            return redirect('/aluno');
        }
    }

    private function _validate(Request $request, $id = 0){

        $rules = [
            'nome' => 'required|max:30',
            'sobre_nome' => 'required|max:30',
            'email' => ['required', 'max:60', \Illuminate\Validation\Rule::unique('alunos')->ignore($id), 'email'],
            'celular' => ['required', 'max:20', \Illuminate\Validation\Rule::unique('alunos')->ignore($id)],
            'cidade_id' => 'required',
            'sexo' => 'required',
            'peso_atual' => 'required',
            'faixa_id' => 'required',
            'grau' => 'required',
            'repita_senha' => $id > 0 ? '' : 'required',
            'data_ultima_graduacao' => 'required',
            'senha' => $id > 0 ? 'same:repita_senha' : 'required|same:repita_senha|min:6',
        ];

        $messages = [
            'nome.required' => 'Nome é obrigatório.',
            'faixa_id.required' => 'Faixa é obrigatório.',
            'grau.required' => 'Grau é obrigatório.',
            'sobre_nome.required' => 'Sobre nome é obrigatório.',
            'email.required' => 'Email é obrigatório.',
            'celular.required' => 'Celular é obrigatório.',
            'cidade_id.required' => 'Cidade é obrigatório.',
            'sexo.required' => 'Sexo é obrigatório.',
            'peso_atual.required' => 'Peso atual é obrigatório.',
            'senha.required' => 'Senha é obrigatório.',
            'repita_senha.required' => 'Repita Senha é obrigatório.',
            'data_ultima_graduacao.required' => 'Data é obrigatório.',

            'nome.required' => '30 caracteres permitidos.',
            'sobre_nome.required' => '30 caracteres permitidos.',
            'email.required' => '60 caracteres permitidos.',
            'celular.required' => '20 caracteres permitidos.',

            'email.unique' => 'Email já cadastrado.',
            'celular.unique' => 'Celular já cadastrado.',
            'senha.same' => 'Senhas não coincidem',
            'senha.min' => 'No mínimo informe 6 caracteres',

            'email.email' => 'Informe um email valido.',

        ];
        $this->validate($request, $rules, $messages);
    }

    public function note($id){
        $item = Aluno::findOrFail($id);
        return view('alunos/note', compact('item'));
    }

    public function storeNote(Request $request, $id){
        $this->_validateAnotacao($request);
        $item = Aluno::findOrFail($id);
        try{
            AlunoAnotacao::create([
                'aluno_id' => $item->id,
                'anotacao' => $request->anotacao,
                'status' => $request->status
            ]);
            session()->flash("flash_sucesso", "Anotação adicionada");
            return redirect()->back();
        }catch(\Exception $e){         
            session()->flash("flash_erro", "Algo deu errado!");
            return redirect()->back();
        }
    }

    private function _validateAnotacao(Request $request, $id = 0){

        $rules = [
            'anotacao' => 'required|max:255',
            'status' => 'required',
        ];

        $messages = [
            'anotacao.required' => 'Este campo é obrigatório.',
            'anotacao.required' => '255 caracteres permitidos.',
            'status.required' => 'Este campo é obrigatório.',

        ];
        $this->validate($request, $rules, $messages);
    }

    public function detail($id){
        $item = Aluno::findOrFail($id);
        $grade = $this->createGrade($item);

        $treinosDoAno = $this->countTreinosDoAno();
        $treinosDoAnoAluno = $this->countTreinosDoAnoAluno($item->id);

        $totalDeTreinos = $treinosDoAno != null ? $treinosDoAno->cont : 0;
        $totalDeTreinosDoAluno = $treinosDoAnoAluno != null ? $treinosDoAnoAluno->cont : 0;
        $percentual = 0;
        if($totalDeTreinosDoAluno > 0){
            $percentual = number_format(100-((($totalDeTreinos-$totalDeTreinosDoAluno)/$totalDeTreinos)
            *100),2);
        }
        return view('alunos/detail', compact('item', 'grade', 'totalDeTreinos', 
            'totalDeTreinosDoAluno', 'percentual'));
    }

    private function createGrade($aluno){
        $dias = 31;
        $linhas = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'];
        $grade = [];
        foreach($linhas as $keyMes => $l){
            $grade[$l] = [];
            for($aux=1; $aux<=$dias; $aux++){
                $marca = $this->searchTreino($keyMes+1, $aux, $aluno->id);

                $temp['dia'] = $aux;
                $temp['status'] = 0;
                if($marca){
                    $temp['status'] = 1;
                }
                array_push($grade[$l], $temp);
            }
        }
        return $grade;
    }

    private function countTreinosDoAno(){
        return Treino::
        selectRaw('count(*) as cont')
        ->whereYear('created_at', date('Y'))
        ->where('status', 1)->first();
    }

    private function countTreinosDoAnoAluno($aluno_id){
        return AlunoTreino::
        selectRaw('count(*) as cont')
        ->whereYear('created_at', date('Y'))
        ->where('aluno_id', $aluno_id)
        ->where('status', 1)->first();
    }

    private function searchTreino($mes, $dia, $aluno_id){
        $data = date('Y')."-". ($mes < 10 ? "0".$mes : $mes) ."-". ($dia < 10 ? "0".$dia : $dia);
        $treinos = Treino::whereDate('data', $data)->where('status', 1)->get();

        if(sizeof($treinos) > 0){
            if(sizeof($treinos) == 1){
                $treino = $treinos[0];
                $alunoTreino = AlunoTreino::
                where('aluno_id', $aluno_id)
                ->where('status', 1)
                ->where('treino_id', $treino->id)
                ->first();

                return $alunoTreino;
            }else{
                foreach($treinos as $t){
                    $alunoTreino = AlunoTreino::
                    where('aluno_id', $aluno_id)
                    ->where('status', 1)
                    ->where('treino_id', $t->id)
                    ->first();
                    if($alunoTreino != null) return $alunoTreino;
                }
            }
        }
        return false;
    }

    public function acessosLogin($aluno_id){
        $item = Aluno::findOrFail($aluno_id);
        return view('alunos/acessos_login', compact('item'));
    }

    public function acessosPosicao($aluno_id){
        $item = Aluno::findOrFail($aluno_id);
        return view('alunos/acessos_posicao', compact('item'));
    }

    public function mensalidades($aluno_id){
        $item = Aluno::findOrFail($aluno_id);
        return view('alunos/mensalidades', compact('item'));
    }

    public function alterarSenha(Request $request, $id){
        $item = Aluno::findOrFail($id);
        try{

            $senha_anterior = $request->senha_anterior;

            if(md5($senha_anterior) != $item->senha){
                session()->flash("flash_erro", "Senha anterior inválida!");
                return redirect()->back();
            }

            $item->senha = md5($request->senha);
            $item->save();
            session()->flash("flash_sucesso", "Sua senha foi alterada oss!");
            return redirect()->back();

        }catch(\Exception $e){
            // echo $e->getMessage();
            // die;            
            session()->flash("flash_erro", "Algo deu errado!");
            return redirect()->back();
        }
    }

    public function salvarToken(Request $request){
        $aluno = Aluno::findOrFail($request->id);
        $novo = true;
        if($aluno->token != "") $novo = false;
        $aluno->token = $request->token;
        $aluno->save();
        return response()->json($novo, 200);
    }

    public function push($id){
        $item = Aluno::findOrFail($id);

        return view('alunos/push', compact('item'));
    }

    public function pushPut(Request $request, $id){
        $aluno = Aluno::findOrFail($request->id);
        $token = $aluno->token;

        $data = [
            'heading' => [
                "en" => $request->titulo
            ],
            'content' => [
                "en" => $request->mensagem
            ],
            'image' => '',
            // 'link' => '',
        ];

        if($token != ''){
            $fields = [
                'app_id' => getenv('ONE_SIGNAL_APP_ID'),
                'contents' => $data['content'],
                'headings' => $data['heading'],
                'large_icon' => getenv('APP_URL').'/images/push.png',
                'small_icon' => 'notification_icon',
                'include_player_ids' => [$token]

            ];
            // $fields['included_segments'] = array('All');

            $fields['chrome_web_image'] = getenv('APP_URL').'/images/push.png';
            $fields = json_encode($fields);

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
            curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=utf-8',
                'Authorization: Basic '.getenv('ONE_SIGNAL_KEY')));
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
            curl_setopt($ch, CURLOPT_HEADER, FALSE);
            curl_setopt($ch, CURLOPT_POST, TRUE);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);

            $response = curl_exec($ch);
            curl_close($ch);

            $obj = json_decode($response);

            session()->flash("flash_sucesso", "Push enviado para o aluno(a) $aluno->full_name, ID AUTH: $obj->id");
            return redirect('/aluno');

        }else{
            session()->flash("flash_erro", "Este cliente não possui token para notificação!");
            return redirect()->back();
        }
    }
}
