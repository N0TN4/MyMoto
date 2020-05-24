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

  Future<dynamic> salvarCadastro(Usuario usuario) {
    return Session.post('${AbstractService.staticAPI}/usuarios',
            body: toJsonUsuario(usuario))
        .then((response) {
      print(response);
      print("JSON POST : ${json.jsonEncode(toJsonUsuario(usuario))}");
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

  Map<String, dynamic> toJsonUsuario(Usuario usuario) => {
        "nome": usuario.nome,
        "login": usuario.login,
        "email": usuario.email,
        "telefone": usuario.telefone,
        "senha": usuario.senha,
        "moto": {
          // "id": moto.id, // consertar para moto_id no backend
         // "id": usuario.moto.id,
          "nome": usuario.moto.nome,
          "modelo": usuario.moto.modelo,
          "marca": usuario.moto.marca,
          "cilindradas": usuario.moto.cilindradas,
          "usuario": null,
          "id_usuario": usuario.id,
          "contador_dias": 0,
          "media_diaria_km": usuario.moto.mediaDiariaKm,
          "km_max_troca_oleo": usuario.moto.kmMaxTrocaOleo,
          "km_max_acelerador": usuario.moto.kmMaxAcelerador,
          "km_max_vela": usuario.moto.kmMaxVela,
          "km_max_freio": usuario.moto.kmMaxFreio,
          "km_max_embreagem": usuario.moto.kmMaxEmbreagem,
          "km_max_pneus": usuario.moto.kmMaxPneus,
          "km_max_suspensao": usuario.moto.kmMaxSuspensao,
          "km_atual_troca_oleo": 0,
          "km_atual_acelerador": 0,
          "km_atual_vela": 0,
          "km_atual_freio": 0,
          "km_atual_embreagem": 0,
          "km_atual_pneus": 0,
          "km_atual_suspensao": 0,
        }
      };

  fromJsonUsuario(json) {
    return new Usuario.fromJson(json);
  }
}
