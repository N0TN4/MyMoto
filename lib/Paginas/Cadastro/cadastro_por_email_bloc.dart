import 'package:mymoto/Modelos/moto.dart';
import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/Paginas/Cadastro/servico_firebase_cadastro_por_email.dart';
import 'package:rxdart/rxdart.dart';

class BlocCadastroPorEmail {
  final _login = BehaviorSubject<String>();
  final _nome = BehaviorSubject<String>();
  final _senha = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _confirmarSenha = BehaviorSubject<String>();
  final _telefone = BehaviorSubject<String>();

  Function(String) get mudarLogin => _login.sink.add;
  Function(String) get mudarNome => _nome.sink.add;
  Function(String) get mudarSenha => _senha.sink.add;
  Function(String) get mudarEmail => _email.sink.add;
  Function(String) get mudarConfirmarSenhar => _confirmarSenha.sink.add;
  Function(String) get mudarTelefone => _telefone.sink.add;
  
  void salvar() {
    Usuario usuario = new Usuario();
    usuario.login = _login.value;
    usuario.senha = _senha.value;
    usuario.email = _email.value;
    usuario.confirmarSenha = _confirmarSenha.value; // todo
    usuario.telefone = _telefone.value;
  }

  void dispose() {
    _login.close();
    _nome.close();
    _senha.close();
    _email.close();
    _confirmarSenha.close();
    _telefone.close();
  }
}
