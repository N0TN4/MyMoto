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

  Stream<List<Moto>> get motos => _motos.stream;

  Function(String) get mudarLogin => _login.sink.add;
  Function(String) get mudarNome => _nome.sink.add;
  Function(String) get mudarSenha => _senha.sink.add;
  Function(String) get mudarEmail => _email.sink.add;
  Function(String) get mudarConfirmarSenhar => _confirmarSenha.sink.add;
  Function(String) get mudarTelefone => _telefone.sink.add;
  Function(String) get mudarModelo => _modelo.sink.add;
  Function(List<Moto>) get mudarMotos => _motos.sink.add;

  ServicoFirebaseCadastroPorEmail _servico =
      new ServicoFirebaseCadastroPorEmail();

  CadastroServices _services = new CadastroServices();

  void salvar() {
    Usuario usuario = new Usuario(
      login: _login.value,
      nome: _nome.value,
      senha: _senha.value,
      //confirmarSenha: _confirmarSenha.value,
      email: _email.value,
      telefone: _telefone.value,
      modelo: _modelo.value,
    );

    // passar o objeto de moto que está sendo criado no cadastro para o bloc (esta tela)

    // moto do usuario é a moto que está foi instanciada
    //usuario.moto.marca = _marca.value;
    //usuario.moto.quiometragem = _quilometragem.value;

    print(usuario.nome);
    _servico.salvar(usuario);
  }

  getMotos() {
    _services.getMotos().then((response) {
      if (response != null) {
        mudarMotos(response);
      } else {
        mudarMotos(null);
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
  }
}
