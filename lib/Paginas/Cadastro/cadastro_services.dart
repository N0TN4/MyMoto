import 'package:mymoto/Modelos/moto.dart';
import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/services/abstract_services.dart';
import 'dart:convert' as json;

class CadastroServices extends AbstractService {
  CadastroServices() : super('/motos');

  List<Moto> getMotos() {
    return getLista();
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

  getLista() {
    List<Moto> motos = new List<Moto>();
    Moto moto1 = new Moto(
      id: 1,
      cilindradas: 160,
      kmMaxTrocaOleo: 6000,
      kmMaxAcelerador: 6000,
      kmMaxVela: 12000,
      kmMaxFreio: 6000,
      kmMaxEmbreagem: 6000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 24000,
      marca: "HONDA",
      modelo: "CG",
      nome: "HONDA CG 160 FAN",
    );

    Moto moto2 = new Moto(
      id: 2,
      cilindradas: 125,
      kmMaxTrocaOleo: 1000,
      kmMaxAcelerador: 5000,
      kmMaxVela: 10000,
      kmMaxFreio: 5000,
      kmMaxEmbreagem: 5000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 5000,
      marca: "YAMAHA",
      modelo: "YBR",
      nome: "YAMAHA YBR 125i ED",
    );

    Moto moto3 = new Moto(
      id: 3,
      cilindradas: 125,
      kmMaxTrocaOleo: 1000,
      kmMaxAcelerador: 5000,
      kmMaxVela: 10000,
      kmMaxFreio: 5000,
      kmMaxEmbreagem: 5000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 5000,
      marca: "SUZUKI",
      modelo: "YES",
      nome: "SUZUKI YES EN125",
    );

    Moto moto4 = new Moto(
      id: 4,
      cilindradas: 109,
      kmMaxTrocaOleo: 6000,
      kmMaxAcelerador: 6000,
      kmMaxVela: 12000,
      kmMaxFreio: 6000,
      kmMaxEmbreagem: 6000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 24000,
      marca: "HONDA",
      modelo: "BIZ",
      nome: "HONDA BIZ 110i",
    );

    Moto moto5 = new Moto(
      id: 5,
      cilindradas: 250,
      kmMaxTrocaOleo: 3000,
      kmMaxAcelerador: 3000,
      kmMaxVela: 12000,
      kmMaxFreio: 3000,
      kmMaxEmbreagem: 3000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 12000,
      marca: "HONDA",
      modelo: "CBX",
      nome: "HONDA CBX 250 TWISTER",
    );

    Moto moto6 = new Moto(
      id: 6,
      cilindradas: 160,
      kmMaxTrocaOleo: 3000,
      kmMaxAcelerador: 3000,
      kmMaxVela: 10000,
      kmMaxFreio: 3000,
      kmMaxEmbreagem: 3000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 12000,
      marca: "SUZUKI",
      modelo: "DR",
      nome: "SUZUKI DR 160",
    );

    Moto moto7 = new Moto(
      id: 7,
      cilindradas: 250,
      kmMaxTrocaOleo: 6000,
      kmMaxAcelerador: 6000,
      kmMaxVela: 12000,
      kmMaxFreio: 6000,
      kmMaxEmbreagem: 6000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 12000,
      marca: "KAWASAKI",
      modelo: "NINJA",
      nome: "KAWASAKI NINJA 250R",
    );

    Moto moto8 = new Moto(
      id: 8,
      cilindradas: 125,
      kmMaxTrocaOleo: 5000,
      kmMaxAcelerador: 5000,
      kmMaxVela: 10000,
      kmMaxFreio: 5000,
      kmMaxEmbreagem: 5000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 12000,
      marca: "YAMAHA",
      modelo: "FACTOR",
      nome: "YAMAHA FACTOR YBR 125",
    );
    Moto moto9 = new Moto(
      id: 9,
      cilindradas: 250,
      kmMaxTrocaOleo: 5000,
      kmMaxAcelerador: 5000,
      kmMaxVela: 10000,
      kmMaxFreio: 5000,
      kmMaxEmbreagem: 5000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 12000,
      marca: "YAMAHA",
      modelo: "FAZER",
      nome: "YAMAHA FAZER 250 ABS",
    );

    Moto moto10 = new Moto(
      id: 10,
      cilindradas: 160,
      kmMaxTrocaOleo: 6000,
      kmMaxAcelerador: 6000,
      kmMaxVela: 12000,
      kmMaxFreio: 6000,
      kmMaxEmbreagem: 6000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 18000,
      marca: "HONDA",
      modelo: "NXR",
      nome: "HONDA NXR 160 BROS",
    );

    motos.add(moto1);
    motos.add(moto2);
    motos.add(moto3);
    motos.add(moto4);
    motos.add(moto5);
    motos.add(moto6);
    motos.add(moto7);
    motos.add(moto8);
    motos.add(moto9);
    motos.add(moto10);

    return motos;
  }

  Map<String, dynamic> toJsonUsuario(Usuario usuario) => {
        "nome": usuario.nome,
        "login": usuario.login,
        "email": usuario.email,
        "telefone": usuario.telefone,
        "senha": usuario.senha,
        "moto": {
          //"id": usuario.moto.id, // consertar para moto_id no backend
          //"id": usuario.moto.id,
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
    print("From Json $json");
    return new Usuario.fromJson(json);
  }
}
