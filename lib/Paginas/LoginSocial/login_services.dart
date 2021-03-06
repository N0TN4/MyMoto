import 'package:mymoto/Modelos/moto.dart';
import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/services/abstract_services.dart';

class LoginServices extends AbstractService {
  LoginServices() : super('/autenticar');

  Future<List<Usuario>> getUsuario() {
    return Session.get('$api').then((response) {
      print(response);
      return fromJson(response);
    });
  }

  Future<Usuario> verificarUsuarioToken(String uid) {
    return Session.get('http://mymotoapi.herokuapp.com/usuarios/social/$uid')
        .then((response) {
      print(response);
      if (response['id'] == 0) {
        return null;
      }
      return fromJson(response);
    });
  }

  Future<dynamic> logar(Usuario usuario) {
    return Session.post('$api', body: usuario.toJsonAuth()).then((response) {
      print(response);
      //corpo
      print(usuario.toJsonAuth());
      // print("JSON POST : ${json.jsonEncode(toJsonUsuario(usuario.toJsonAuth())}");
      return fromJson(response);
    });
  }

  @override
  fromJson(json) {
    // List<Usuario> usuarios = new List<Usuario>();
    // if (json != null) {
    //   json.forEach((response) {
    //     usuarios.add(new Usuario.fromJson(response));
    //   });
    //   return usuarios;
    // } else {
    //   return null;
    // }
    return new Usuario.fromJson(json);
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
          "contador_dias": 0,
          "media_diaria_km": usuario.moto.mediaDiariaKm,
          "km_max_troca_oleo": moto.kmMaxTrocaOleo,
          "km_max_acelerador": moto.kmMaxAcelerador,
          "km_max_vela": moto.kmMaxVela,
          "km_max_freio": moto.kmMaxFreio,
          "km_max_embreagem": moto.kmMaxEmbreagem,
          "km_max_pneus": moto.kmMaxPneus,
          "km_max_suspensao": moto.kmMaxSuspensao,
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
    return json;
  }
}
