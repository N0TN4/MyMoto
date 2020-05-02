import 'package:mymoto/Modelos/moto.dart';
import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/services/abstract_services.dart';
import 'dart:convert' as json;
class CadastroServices extends AbstractService {
  CadastroServices() : super('/motos');

  Future<List<Moto>> getMotos() {
    return Session.get('$api').then((response) {
      print(response);
      return fromJson(response);
    });
  }

  Future<dynamic> salvarCadastro(Usuario usuario, Moto moto) {
    return Session.post('${AbstractService.staticAPI}/usuarios',
            body: toJsonUsuario(usuario, moto))
        .then((response) {
      print(response);
      print("JSON POST : ${json.jsonEncode(toJsonUsuario(usuario, moto))}");
      return fromJsonUsuario(response);
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

  Map<String, dynamic> toJsonUsuario(Usuario usuario, Moto moto) => {
        "nome": usuario.nome,
        "login": usuario.login,
        "email": usuario.email,
        "telefone": usuario.telefone,
        "senha": usuario.senha,
        "moto": {
         // "id": moto.id, // consertar para moto_id no backend
          "nome": moto.nome,
          "modelo": moto.modelo,
          "marca": moto.marca,
          "cilindradas": moto.cilindradas,
          "usuario": null,
          "id_usuario": usuario.id,
        }
      };

  fromJsonUsuario(json) {
    return json;
  }
}
