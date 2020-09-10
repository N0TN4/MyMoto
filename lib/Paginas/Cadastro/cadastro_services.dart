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

    Moto moto11 = new Moto(
      id: 11,
      cilindradas: 109,
      kmMaxTrocaOleo: 6000,
      kmMaxAcelerador: 6000,
      kmMaxVela: 12000,
      kmMaxFreio: 6000,
      kmMaxEmbreagem: 6000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 18000,
      marca: "HONDA",
      modelo: "POP",
      nome: "HONDA POP 110i",
    );
    Moto moto12 = new Moto(
      id: 12,
      cilindradas: 150,
      kmMaxTrocaOleo: 6000,
      kmMaxAcelerador: 6000,
      kmMaxVela: 12000,
      kmMaxFreio: 6000,
      kmMaxEmbreagem: 12000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 18000,
      marca: "HONDA",
      modelo: "PCX",
      nome: "HONDA PCX 150",
    );

    Moto moto13 = new Moto(
      id: 13,
      cilindradas: 300,
      kmMaxTrocaOleo: 6000,
      kmMaxAcelerador: 12000,
      kmMaxVela: 48000,
      kmMaxFreio: 6000,
      kmMaxEmbreagem: 6000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 12000,
      marca: "HONDA",
      modelo: "XRE",
      nome: "HONDA XRE 300",
    );

    Moto moto14 = new Moto(
      id: 14,
      cilindradas: 150,
      kmMaxTrocaOleo: 5000,
      kmMaxAcelerador: 5000,
      kmMaxVela: 10000,
      kmMaxFreio: 5000,
      kmMaxEmbreagem: 5000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 5000,
      marca: "YAMAHA",
      modelo: "CROSSER",
      nome: "YAMAHA CROSSER 150",
    );

    Moto moto15 = new Moto(
      id: 15,
      cilindradas: 190,
      kmMaxTrocaOleo: 6000,
      kmMaxAcelerador: 6000,
      kmMaxVela: 12000,
      kmMaxFreio: 6000,
      kmMaxEmbreagem: 6000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 6000,
      marca: "HONDA",
      modelo: "XRE",
      nome: "HONDA XRE 190",
    );

    Moto moto16 = new Moto(
      id: 16,
      cilindradas: 125,
      kmMaxTrocaOleo: 4000,
      kmMaxAcelerador: 4000,
      kmMaxVela: 8000,
      kmMaxFreio: 4000,
      kmMaxEmbreagem: 8000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 4000,
      marca: "HONDA",
      modelo: "ELITE",
      nome: "HONDA ELITE 125",
    );

    Moto moto17 = new Moto(
      id: 17,
      cilindradas: 250,
      kmMaxTrocaOleo: 5000,
      kmMaxAcelerador: 5000,
      kmMaxVela: 10000,
      kmMaxFreio: 5000,
      kmMaxEmbreagem: 5000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 10000,
      marca: "YAMAHA",
      modelo: "LANDER",
      nome: "YAMAHA LANDER 250 ABS",
    );

    Moto moto18 = new Moto(
      id: 18,
      cilindradas: 160,
      kmMaxTrocaOleo: 5000,
      kmMaxAcelerador: 5000,
      kmMaxVela: 10000,
      kmMaxFreio: 5000,
      kmMaxEmbreagem: 5000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 5000,
      marca: "YAMAHA",
      modelo: "NMAX",
      nome: "YAMAHA NMAX 160 ABS",
    );

    Moto moto19 = new Moto(
      id: 19,
      cilindradas: 125,
      kmMaxTrocaOleo: 3000,
      kmMaxAcelerador: 3000,
      kmMaxVela: 6000,
      kmMaxFreio: 3000,
      kmMaxEmbreagem: 3000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 3000,
      marca: "HONDA",
      modelo: "NEO",
      nome: "YAMAHA NEO 125",
    );

    Moto moto20 = new Moto(
      id: 20,
      cilindradas: 150,
      kmMaxTrocaOleo: 5000,
      kmMaxAcelerador: 5000,
      kmMaxVela: 10000,
      kmMaxFreio: 5000,
      kmMaxEmbreagem: 5000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 5000,
      marca: "YAMAHA",
      modelo: "FAZER",
      nome: "YAMAHA FAZER 150",
    );

    Moto moto21 = new Moto(
      id: 21,
      cilindradas: 50,
      kmMaxTrocaOleo: 1000,
      kmMaxAcelerador: 4000,
      kmMaxVela: 12000,
      kmMaxFreio: 4000,
      kmMaxEmbreagem: 4000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 4000,
      marca: "SHINERAY",
      modelo: "SMART",
      nome: "SHINERAY NEW SUPER SMART 50",
    );
    Moto moto22 = new Moto(
      id: 22,
      cilindradas: 125,
      kmMaxTrocaOleo: 4000,
      kmMaxAcelerador: 4000,
      kmMaxVela: 8000,
      kmMaxFreio: 4000,
      kmMaxEmbreagem: 8000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 4000,
      marca: "HONDA",
      modelo: "CG",
      nome: "HONDA CG 125i CARGO",
    );
    Moto moto23 = new Moto(
      id: 23,
      cilindradas: 150,
      kmMaxTrocaOleo: 3000,
      kmMaxAcelerador: 3000,
      kmMaxVela: 10000,
      kmMaxFreio: 3000,
      kmMaxEmbreagem: 3000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 3000,
      marca: "HAOJUE",
      modelo: "DK",
      nome: "HAOJUE DK 150",
    );

    Moto moto24 = new Moto(
      id: 24,
      cilindradas: 150,
      kmMaxTrocaOleo: 6000,
      kmMaxAcelerador: 6000,
      kmMaxVela: 12000,
      kmMaxFreio: 6000,
      kmMaxEmbreagem: 12000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 6000,
      marca: "HONDA",
      modelo: "SH",
      nome: "HONDA SH 150",
    );

    Moto moto25 = new Moto(
      id: 25,
      cilindradas: 150,
      kmMaxTrocaOleo: 3000,
      kmMaxAcelerador: 3000,
      kmMaxVela: 10000,
      kmMaxFreio: 3000,
      kmMaxEmbreagem: 3000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 3000,
      marca: "HAOJUE",
      modelo: "CHOPPER",
      nome: "HAOJUE CHOPPER 150",
    );
    Moto moto26 = new Moto(
      id: 26,
      cilindradas: 250,
      kmMaxTrocaOleo: 4000,
      kmMaxAcelerador: 4000,
      kmMaxVela: 12000,
      kmMaxFreio: 4000,
      kmMaxEmbreagem: 4000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 4000,
      marca: "SHINERAY",
      modelo: "BOLT",
      nome: "SHINERAY BOLT 250",
    );
    Moto moto27 = new Moto(
      id: 27,
      cilindradas: 250,
      kmMaxTrocaOleo: 1000,
      kmMaxAcelerador: 4000,
      kmMaxVela: 12000,
      kmMaxFreio: 4000,
      kmMaxEmbreagem: 8000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 4000,
      marca: "SHINERAY",
      modelo: "DISCOVER",
      nome: "SHINERAY DISCOVER 250",
    );
    Moto moto28 = new Moto(
      id: 28,
      cilindradas: 50,
      kmMaxTrocaOleo: 4000,
      kmMaxAcelerador: 4000,
      kmMaxVela: 12000,
      kmMaxFreio: 4000,
      kmMaxEmbreagem: 4000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 4000,
      marca: "SHINERAY",
      modelo: "JET",
      nome: "JET + 50",
    );

    Moto moto29 = new Moto(
      id: 29,
      cilindradas: 250,
      kmMaxTrocaOleo: 6000,
      kmMaxAcelerador: 12000,
      kmMaxVela: 48000,
      kmMaxFreio: 12000,
      kmMaxEmbreagem: 6000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 12000,
      marca: "HONDA",
      modelo: "CBR",
      nome: "HONDA CBR 250R",
    );

    Moto moto30 = new Moto(
      id: 30,
      cilindradas: 150,
      kmMaxTrocaOleo: 1500,
      kmMaxAcelerador: 3000,
      kmMaxVela: 3000,
      kmMaxFreio: 3000,
      kmMaxEmbreagem: 3000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 6000,
      marca: "HONDA",
      modelo: "CBX",
      nome: "HONDA CBX 15O AERO",
    );

    Moto moto31 = new Moto(
      id: 31,
      cilindradas: 150,
      kmMaxTrocaOleo: 4000,
      kmMaxAcelerador: 4000,
      kmMaxVela: 8000,
      kmMaxFreio: 4000,
      kmMaxEmbreagem: 8000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 4000,
      marca: "HONDA",
      modelo: "CG TITAN",
      nome: "HONDA CG 150 TITAN",
    );
    Moto moto32 = new Moto(
      id: 32,
      cilindradas: 110,
      kmMaxTrocaOleo: 1000,
      kmMaxAcelerador: 2000,
      kmMaxVela: 1000,
      kmMaxFreio: 1000,
      kmMaxEmbreagem: 1000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 2000,
      marca: "HONDA",
      modelo: "CRF",
      nome: "HONDA CRF 110F",
    );
    Moto moto33 = new Moto(
      id: 33,
      cilindradas: 250,
      kmMaxTrocaOleo: 1000,
      kmMaxAcelerador: 2000,
      kmMaxVela: 1000,
      kmMaxFreio: 1000,
      kmMaxEmbreagem: 1000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 2000,
      marca: "HONDA",
      modelo: "CRF",
      nome: "HONDA CRF 25OF",
    );

    Moto moto34 = new Moto(
      id: 34,
      cilindradas: 200,
      kmMaxTrocaOleo: 1500,
      kmMaxAcelerador: 3000,
      kmMaxVela: 8000,
      kmMaxFreio: 3000,
      kmMaxEmbreagem: 3000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 6000,
      marca: "HONDA",
      modelo: "NX",
      nome: "HONDA NX 200",
    );

    Moto moto35 = new Moto(
      id: 35,
      cilindradas: 250,
      kmMaxTrocaOleo: 3000,
      kmMaxAcelerador: 3000,
      kmMaxVela: 12000,
      kmMaxFreio: 3000,
      kmMaxEmbreagem: 3000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 6000,
      marca: "HONDA",
      modelo: "XR TORNADO",
      nome: "HONDA XR 250 TORNADO",
    );

    Moto moto36 = new Moto(
      id: 36,
      cilindradas: 115,
      kmMaxTrocaOleo: 3000,
      kmMaxAcelerador: 3000,
      kmMaxVela: 12000,
      kmMaxFreio: 3000,
      kmMaxEmbreagem: 3000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 3000,
      marca: "YAMAHA",
      modelo: "CRYPTON",
      nome: "YAMAHA CRYPTON 110",
    );

    Moto moto37 = new Moto(
      id: 37,
      cilindradas: 320,
      kmMaxTrocaOleo: 5000,
      kmMaxAcelerador: 5000,
      kmMaxVela: 10000,
      kmMaxFreio: 5000,
      kmMaxEmbreagem: 5000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 5000,
      marca: "YAMAHA",
      modelo: "MT",
      nome: "YAMAHA MT-O3 ABS",
    );
    Moto moto38 = new Moto(
      id: 38,
      cilindradas: 320,
      kmMaxTrocaOleo: 5000,
      kmMaxAcelerador: 5000,
      kmMaxVela: 10000,
      kmMaxFreio: 5000,
      kmMaxEmbreagem: 5000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 5000,
      marca: "YAMAHA",
      modelo: "MT",
      nome: "YAMAHA MT-O3 ABS",
    );

    Moto moto39 = new Moto(
      id: 39,
      cilindradas: 320,
      kmMaxTrocaOleo: 5000,
      kmMaxAcelerador: 5000,
      kmMaxVela: 10000,
      kmMaxFreio: 5000,
      kmMaxEmbreagem: 5000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 5000,
      marca: "YAMAHA",
      modelo: "R3",
      nome: "YAMAHA YZF-R3",
    );

    Moto moto40 = new Moto(
      id: 40,
      cilindradas: 320,
      kmMaxTrocaOleo: 5000,
      kmMaxAcelerador: 5000,
      kmMaxVela: 10000,
      kmMaxFreio: 5000,
      kmMaxEmbreagem: 5000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 5000,
      marca: "YAMAHA",
      modelo: "FACTOR",
      nome: "YAMAHA FACTOR YBR 150 E",
    );

    Moto moto41 = new Moto(
      id: 41,
      cilindradas: 230,
      kmMaxTrocaOleo: 2000,
      kmMaxAcelerador: 2000,
      kmMaxVela: 5000,
      kmMaxFreio: 2000,
      kmMaxEmbreagem: 2000,
      kmMaxPneus: 1000,
      kmMaxSuspensao: 3000,
      marca: "YAMAHA",
      modelo: "TT-R",
      nome: "YAMAHA TT-R 230",
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
    motos.add(moto11);
    motos.add(moto12);
    motos.add(moto13);
    motos.add(moto14);
    motos.add(moto15);
    motos.add(moto16);
    motos.add(moto17);
    motos.add(moto18);
    motos.add(moto19);
    motos.add(moto20);
    motos.add(moto21);
    motos.add(moto22);
    motos.add(moto23);
    motos.add(moto24);
    motos.add(moto25);
    motos.add(moto26);
    motos.add(moto27);
    motos.add(moto28);
    motos.add(moto29);
    motos.add(moto30);
    motos.add(moto31);
    motos.add(moto32);
    motos.add(moto33);
    motos.add(moto34);
    motos.add(moto35);
    motos.add(moto36);
    motos.add(moto37);
    motos.add(moto38);
    motos.add(moto39);
    motos.add(moto40);
    motos.add(moto41);

    return motos;
  }

  Map<String, dynamic> toJsonUsuario(Usuario usuario) => {
        "nome": usuario.nome,
        "login": usuario.login,
        "email": usuario.email,
        "tokenUid": usuario.tokenUid,
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
