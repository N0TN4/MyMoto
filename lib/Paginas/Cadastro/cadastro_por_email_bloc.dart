import 'package:mymoto/Modelos/moto.dart';
import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/Paginas/Cadastro/cadastro_services.dart';
import 'package:mymoto/Paginas/Cadastro/servico_firebase_cadastro_por_email.dart';
import 'package:rxdart/rxdart.dart';

class BlocCadastroPorEmail {
  final _login = BehaviorSubject<String>();
  final _nome = BehaviorSubject<String>();
  final _senha = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _confirmarSenha = BehaviorSubject<String>();
  final _telefone = BehaviorSubject<String>();
  final _modelo = BehaviorSubject<String>();
  final _motos = BehaviorSubject<List<Moto>>();
  final _marcas = BehaviorSubject<List<String>>();
  final _modelos = BehaviorSubject<List<String>>();
  final _nomeMoto = BehaviorSubject<List<String>>();

  final _motoSelecionada = BehaviorSubject<Moto>();
  final _kmDiariaSelecionada = BehaviorSubject<num>();

  Stream<List<Moto>> get motos => _motos.stream;
  Stream<List<String>> get marcas => _marcas.stream;
  Stream<List<String>> get modelos => _modelos.stream;
  Stream<List<String>> get nomeMoto => _nomeMoto.stream;
  Stream<Moto> get motoSelecionada => _motoSelecionada.stream;
  Stream<num> get kmDiariaSelecionada => _kmDiariaSelecionada.stream;

  Function(String) get mudarLogin => _login.sink.add;
  Function(String) get mudarNome => _nome.sink.add;
  Function(String) get mudarSenha => _senha.sink.add;
  Function(String) get mudarEmail => _email.sink.add;
  Function(String) get mudarConfirmarSenhar => _confirmarSenha.sink.add;
  Function(String) get mudarTelefone => _telefone.sink.add;
  Function(String) get mudarModelo => _modelo.sink.add;
  Function(List<Moto>) get mudarMotos => _motos.sink.add;
  Function(List<String>) get mudarMarcas => _marcas.sink.add;
  Function(List<String>) get mudarModelos => _modelos.sink.add;
  Function(List<String>) get mudarNomeMoto => _nomeMoto.sink.add;
  Function(Moto) get mudarMotoSelecioanda => _motoSelecionada.sink.add;
Function(num) get mudarkmDiariaSelecionada => _kmDiariaSelecionada.sink.add;
  ServicoFirebaseCadastroPorEmail _servico =
      new ServicoFirebaseCadastroPorEmail();

  CadastroServices _services = new CadastroServices();

  void salvar() async {
    Usuario usuario = new Usuario();
    usuario.nome = _nome.value;
    usuario.login = _login.value;
    usuario.senha = _senha.value;
    usuario.email = _email.value;
    usuario.telefone = _telefone.value;
    usuario.mediaDiaria = _kmDiariaSelecionada.value;
    Moto moto = new Moto();
    moto = _motoSelecionada.value;
    print(_kmDiariaSelecionada.value);
    
    print("${usuario.nome}"); 
    await _services.salvarCadastro(usuario, moto).then((response) {
      print("POST - $response");
    });
  }

  selecionarMoto(String nomeDaMotoSelecionada) {
    _motos.value.forEach((moto) {
      if (moto.nome == nomeDaMotoSelecionada) {
        mudarMotoSelecioanda(moto);
      }
    });
  }

  getMotos() {
    List<String> marcas = new List<String>();
    List<String> modelos = new List<String>();
    List<String> nomeMoto = new List<String>();
    _services.getMotos().then((response) {
      if (response != null) {
        response.forEach((moto) {
          marcas.add(moto.marca);
          modelos.add(moto.modelo);
          nomeMoto.add(moto.nome);
        });
        mudarMotos(response);
        mudarMarcas(marcas);
        mudarModelos(modelos);
        mudarNomeMoto(nomeMoto);
      } else {
        mudarMotos(null);
        mudarMarcas(null);
        mudarModelos(null);
        mudarNomeMoto(null);
      }
    });
  }

  void dispose() {
    _login.close();
    _nome.close();
    _senha.close();
    _email.close();
    _confirmarSenha.close();
    _telefone.close();
    _modelo.close();
    _motos.close();
    _marcas.close();
    _modelos.close();
    _nomeMoto.close();
    _motoSelecionada.close();
    _kmDiariaSelecionada.close();
  }
}
