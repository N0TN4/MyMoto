import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';
import 'package:mymoto/Paginas/LoginSocial/login_services.dart';
import 'package:mymoto/Paginas/LoginSocial/servico_firebase.dart';
import 'package:rxdart/rxdart.dart';

class BlocLoginSocial {
  final _login = BehaviorSubject<String>();
  final _senha = BehaviorSubject<String>();

  Stream<String> get login => _login.stream;
  Stream<String> get senha => _senha.stream;

  Function(String) get mudarLogin => _login.sink.add;
  Function(String) get mudarSenha => _senha.sink.add;

  ServicoFirebase _servico = ServicoFirebase();
  LoginServices _services = new LoginServices();

  void salvar() {
    Usuario usuario = new Usuario();
    usuario.login = _login.value;
    usuario.senha = _senha.value;
    print(usuario.login);
    print(usuario.senha);
    _servico.salvar(usuario);
  }

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

    // String loginAuxiliar;
    // String senhaAuxiliar;
    // bool logado = false;
    // Future<bool> futuro = Future(() => false); // inicializa logado como falso
    // // consulta
    // Firestore.instance
    //     .collection('usuarios')
    //     .where('login', isEqualTo: _login.value)
    //     .snapshots()
    //     .listen((onData) {
    //   print(onData.documents[0].data);
    //   loginAuxiliar = onData.documents[0].data['login'];
    //   senhaAuxiliar = onData.documents[0].data['senha'];
    //   if (_senha.value == senhaAuxiliar) {
    //     print("Sucesso");
    //     logado = true;
    //   } else {
    //     print("Senha errada");
    //     logado = false;
    //   }
    // });
    //print("Logado ? $logado");
    //return logado;
  }

  void dispose() {
    _login.close();
    _senha.close();
  }
}
