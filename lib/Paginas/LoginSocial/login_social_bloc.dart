import 'dart:async';
import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';
import 'package:mymoto/Paginas/LoginSocial/login_services.dart';

import 'package:rxdart/rxdart.dart';

class BlocLoginSocial {
  final _login = BehaviorSubject<String>();
  final _senha = BehaviorSubject<String>();

  Stream<String> get login => _login.stream;
  Stream<String> get senha => _senha.stream;

  Function(String) get mudarLogin => _login.sink.add;
  Function(String) get mudarSenha => _senha.sink.add;

  LoginServices _services = new LoginServices();

  Future<bool> logar(usuario) async {
    return await _services.logar(usuario).then((response) {
      if (response != null) {
        UsuarioLogado.usuario = response;
        return true;
      } else {
        return false;
        // tratar false;
      }
    });
  }

  Future<Usuario> verificarUsuarioToken(String uid) =>
      _services.verificarUsuarioToken(uid);

  void dispose() {
    _login.close();
    _senha.close();
  }
}
