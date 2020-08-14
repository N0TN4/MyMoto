import 'package:mymoto/Modelos/moto.dart';
import 'package:mymoto/Modelos/usuario.dart' as motoModel;
import 'package:mymoto/Modelos/usuario_logado.dart';
import 'package:mymoto/Paginas/Cadastro/cadastro_services.dart';
import 'package:mymoto/services/abstract_services.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:convert' as convert;

class AlteraMotoBloc extends AbstractService {
  // http://mymotoapi.herokuapp.com/usuarios/1/moto
  AlteraMotoBloc() : super('');
  fromJson(json) => new Moto.fromJson(json);

  static List<Moto> allMotos = new List<Moto>();
  final _motosBuscadas = BehaviorSubject<List<Moto>>();
  Stream<List<Moto>> get motosBuscadas => _motosBuscadas.stream;
  Function(List<Moto>) get mudarMotosBuscadas => _motosBuscadas.sink.add;
  CadastroServices _services = new CadastroServices();

  dispose() {
    _motosBuscadas.close();
  }
  //criar lista de todas as motos ( as primeiras)

  getMotos() {
    List<Moto> motos = _services.getMotos();
    allMotos = motos;
    mudarMotosBuscadas(motos);
  }

  Future<Moto> putNovaMotoUsuario(Moto moto) {
    return Session.put(
            '${AbstractService.staticAPI}/usuarios/${UsuarioLogado.usuario.id}/moto',
            body: moto.toJson())
        .then((response) {
      UsuarioLogado.usuario.moto =
          new motoModel.MotoModel.fromJson(convert.jsonDecode(response));
      print(response);
    });
  }

  buscarMotos(busca) {
    // if (todosAsPecas.length == 0) {
    //   todosAsPecas = appStore.state.pecasState.pecas;
    //   print("a");
    // }
    List<Moto> listaDeMotosBuscadas = new List<Moto>();
    listaDeMotosBuscadas = allMotos
        .where((moto) =>
            moto.nome.toLowerCase().contains(busca.toString().toLowerCase()))
        .toList();
    mudarMotosBuscadas(listaDeMotosBuscadas);
    return listaDeMotosBuscadas;
  }
}
