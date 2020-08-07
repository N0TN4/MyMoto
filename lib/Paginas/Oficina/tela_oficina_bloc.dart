import 'package:mymoto/Modelos/usuario_model.dart';
import 'package:mymoto/Paginas/Oficina/oficina_services.dart';
import 'package:rxdart/rxdart.dart';

class TelaOficinaBloc {
  final _usuarioMoto = BehaviorSubject<UsuarioModel>();
  Stream<UsuarioModel> get usuarioMoto => _usuarioMoto.stream;
  Function(UsuarioModel) get mudarUsuarioMoto => _usuarioMoto.sink.add;

  OficinaServices _services = new OficinaServices();

  dispose() {
    _usuarioMoto.close();
  }

  submit() async {
    return await _services
        .putMotoOficina(_usuarioMoto.value)
        .then((value) => print(value));
  }

  getUsuarioMoto() async {
    return await _services.getUsuarioMoto().then((value) {
      DateTime dataAtual = DateTime.now();
      // value.moto = baseado na ultima alteração da moto, e não do usuário.s
      Duration difference = dataAtual.difference(value.moto.dataDeAlteracao);

      num contadorDeDias = difference.inDays;
      print(contadorDeDias);
      // km a ser alterados em dia
      num totalKmPassadosMedia = value.moto.mediaDiariaKm * contadorDeDias;
      // alterando o atual de km das pecas da moto
      value.moto.kmAtualAcelerador += totalKmPassadosMedia;
      value.moto.kmAtualEmbreagem += totalKmPassadosMedia;
      value.moto.kmAtualFreio += totalKmPassadosMedia;
      value.moto.kmAtualPneus += totalKmPassadosMedia;
      value.moto.kmAtualSuspensao += totalKmPassadosMedia;
      value.moto.kmAtualTrocaOleo += totalKmPassadosMedia;
      value.moto.kmAtualVela += totalKmPassadosMedia;

      mudarUsuarioMoto(value);
    });
  }

  num calcularPorcentagem(num kmAtual, kmMax) {
    if (kmAtual > kmMax) {
      kmAtual = kmMax;
    }
    num percentual = ((kmAtual - kmMax) / kmMax) * 100;
    return percentual < 0 ? (percentual * -1).toInt() : percentual.toInt();
  }
}
