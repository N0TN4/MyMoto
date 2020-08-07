import 'package:mymoto/Modelos/usuario_logado.dart';

import 'package:rxdart/rxdart.dart';

class BlocLoginSocial {
  final _usuarioLogado = BehaviorSubject<UsuarioLogado>();

  Stream<UsuarioLogado> get usuarioLogado => _usuarioLogado.stream;

  Function(UsuarioLogado) get mudarUsuarioLogado => _usuarioLogado.sink.add;

  void getUsuario() {}

  void dispose() {
    _usuarioLogado.close();
  }
}
