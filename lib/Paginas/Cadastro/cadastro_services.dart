import 'package:mymoto/Modelos/moto.dart';
import 'package:mymoto/services/abstract_services.dart';

class CadastroServices extends AbstractService {
  CadastroServices() : super('/motos');

  Future<List<Moto>> getMotos() {
    return Session.get('$api').then((response) {
      print(response);
      return fromJson(response);
    });
  }

  @override
  fromJson(json) {
    List<Moto> motos = new List<Moto>();
    if (json != null) {
      json.forEach((response) {
        motos.add(new Moto.fromJson(response));
      });
      return motos;
    } else {
      return null;
    }
  }
}
