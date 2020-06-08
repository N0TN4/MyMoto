import 'package:mymoto/Modelos/moto.dart';
import 'package:mymoto/Modelos/ponto_de_interesse.dart';
import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/services/abstract_services.dart';
import 'dart:convert' as json;

class MapaServices extends AbstractService {
  MapaServices() : super('/');
  static String apiKeyGoogle = "AIzaSyDB_OwiXpM9oDGvnkbQUs9EwwmwrhgNaU4";
  Future<List<PontoDeInteresse>> getPostosDeGasolinaProximos(
      double lat, double lon) {
    return Session.get(
            'https://maps.googleapis.com/maps/api/place/textsearch/json?types=gas_station' +
                '&location=$lat,$lon&radius=10000&key=$apiKeyGoogle')
        .then((response) {
      print(response);
      return fromJson(response);
    });
  }

  Future<List<PontoDeInteresse>> getPontosOficina(double lat, double lon) {
    return Session.get(
            'https://maps.googleapis.com/maps/api/place/textsearch/json?query=moto&types=car_repair' +
                '&location=$lat,$lon&radius=10000&key=$apiKeyGoogle')
        .then((response) {
      print(response);
      return fromJson(response);
    });
  }

  @override
  fromJson(json) {
    List<PontoDeInteresse> pois = new List<PontoDeInteresse>();
    if (json["results"] != null) {
      json['results'].forEach((json) {
        PontoDeInteresse poi = new PontoDeInteresse();
        poi.nome = json['name'];
        // poi.foto = json["icon"];
        poi.latitude = json["geometry"]['location']["lat"];
        poi.longitude = json["geometry"]['location']["lng"];
        pois.add(poi);
      });
      return pois;
    }
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
