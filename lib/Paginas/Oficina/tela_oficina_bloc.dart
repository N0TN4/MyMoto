import 'package:flutter/cupertino.dart';
import 'package:mymoto/Modelos/usuario_model.dart';
import 'package:mymoto/Paginas/Oficina/oficina_services.dart';
import 'package:rxdart/rxdart.dart';

class TelaOficinaBloc {
  final _usuarioMoto = BehaviorSubject<UsuarioModel>();
  Stream<UsuarioModel> get usuarioMoto => _usuarioMoto.stream;
  Function(UsuarioModel) get mudarUsuarioMoto => _usuarioMoto.sink.add;

  OficinaServices _services = new OficinaServices();

  getUsuarioMoto() async {
    return await _services.getUsuarioMoto().then((value) {
      mudarUsuarioMoto(value);
    });
  }

  dispose() {
    _usuarioMoto.close();
  }

  num calcularPorcentagem(num kmAtual, kmMax) {
    // incluir regra max -
    num percentual = ((kmAtual - kmMax) / kmMax) * 100;

    return percentual < 0 ? (percentual * -1).toInt() : percentual.toInt();
  }
}
