import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';
import 'package:mymoto/Modelos/usuario_model.dart';
import 'package:mymoto/services/abstract_services.dart';
import 'dart:convert' as json;

class OficinaServices extends AbstractService {
  OficinaServices() : super('/usuarios');

  Future<UsuarioModel> getUsuarioMoto() {
    return Session.get(
            '${AbstractService.staticAPI}/usuarios/${UsuarioLogado.usuario.id}')
        .then((response) {
      print(response);
      return fromJson(response);
    });
  }

  Future<dynamic> putMotoOficina(UsuarioModel usuario) {
    return Session.put(
            '${AbstractService.staticAPI}/usuarios/${UsuarioLogado.usuario.id}/moto',
            body: usuario.moto.toJson())
        .then((response) {
      print(response);
      print("JSON POST : ${json.jsonEncode(usuario.moto.toJson())}");
      return fromJsonUsuario(response);
    });
  }

  @override
  fromJson(json) {
    UsuarioModel usuarioModel;
    if (json != null) {
      usuarioModel = UsuarioModel.fromJson(json);
      return usuarioModel;
    } else {
      return null;
    }
  }

  // Map<String, dynamic> toJsonUsuario(Usuario usuario, Moto moto) => {
  //       "nome": usuario.nome,
  //       "login": usuario.login,
  //       "email": usuario.email,
  //       "telefone": usuario.telefone,
  //       "senha": usuario.senha,
  //       "moto": {
  //         // "id": moto.id, // consertar para moto_id no backend

  //         "nome": moto.nome,
  //         "modelo": moto.modelo,
  //         "marca": moto.marca,
  //         "cilindradas": moto.cilindradas,
  //         "usuario": null,
  //         "id_usuario": usuario.id,
  //         "contador_dias": 0,
  //         "media_diaria_km": usuario.mediaDiaria,
  //         "km_max_troca_oleo": moto.kmMaxTrocaOleo,
  //         "km_max_acelerador": moto.kmMaxAcelerador,
  //         "km_max_vela": moto.kmMaxVela,
  //         "km_max_freio": moto.kmMaxFreio,
  //         "km_max_embreagem": moto.kmMaxEmbreagem,
  //         "km_max_pneus": moto.kmMaxPneus,
  //         "km_max_suspensao": moto.kmMaxSuspensao,
  //         "km_atual_troca_oleo": 0,
  //         "km_atual_acelerador": 0,
  //         "km_atual_vela": 0,
  //         "km_atual_freio": 0,
  //         "km_atual_embreagem": 0,
  //         "km_atual_pneus": 0,
  //         "km_atual_suspensao": 0,
  //       }
  //     };

  fromJsonUsuario(json) {
    return json;
  }
}
