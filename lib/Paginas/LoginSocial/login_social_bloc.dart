import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/Paginas/LoginSocial/servico_firebase.dart';
import 'package:rxdart/rxdart.dart';

class BlocLoginSocial{
  final _login = BehaviorSubject<String>();
  final _senha = BehaviorSubject<String>();

  Stream<String> get login => _login.stream;
  Stream<String> get senha => _login.stream;

  Function(String) get mudarLogin => _login.sink.add;
  Function(String) get mudarSenha => _senha.sink.add;

  ServicoFirebase _servico = ServicoFirebase();

  void salvar(){
    Usuario usuario = new Usuario();
    usuario.login = _login.value;
    usuario.senha = _senha.value;
    print(usuario.login);
    print(usuario.senha);
    _servico.salvar(usuario);
  }


  void dispose(){
    _login.close();
    _senha.close();
  }
}