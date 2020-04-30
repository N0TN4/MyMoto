// To parse this JSON data, do
//
//     final moto = motoFromJson(jsonString);

import 'dart:convert';

Moto motoFromJson(String str) => Moto.fromJson(json.decode(str));

String motoToJson(Moto data) => json.encode(data.toJson());

class Moto {
  int id;
  String nome;
  String marca;
  String modelo;
  int cilindradas;
  int kmMaxTrocaOleo;
  int kmMaxAcelerador;
  int kmMaxVela;
  int kmMaxFreio;
  int kmMaxEmbreagem;
  int kmMaxPneus;
  int kmMaxSuspensao;

  Moto({
    this.id,
    this.nome,
    this.marca,
    this.modelo,
    this.cilindradas,
    this.kmMaxTrocaOleo,
    this.kmMaxAcelerador,
    this.kmMaxVela,
    this.kmMaxFreio,
    this.kmMaxEmbreagem,
    this.kmMaxPneus,
    this.kmMaxSuspensao,
  });

  factory Moto.fromJson(Map<String, dynamic> json) => Moto(
        id: json["id"],
        nome: json["nome"],
        marca: json["marca"],
        modelo: json["modelo"],
        cilindradas: json["cilindradas"],
        kmMaxTrocaOleo: json["km_max_troca_oleo"],
        kmMaxAcelerador: json["km_max_acelerador"],
        kmMaxVela: json["km_max_vela"],
        kmMaxFreio: json["km_max_freio"],
        kmMaxEmbreagem: json["km_max_embreagem"],
        kmMaxPneus: json["km_max_pneus"],
        kmMaxSuspensao: json["km_max_suspensao"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "marca": marca,
        "modelo": modelo,
        "cilindradas": cilindradas,
        "km_max_troca_oleo": kmMaxTrocaOleo,
        "km_max_acelerador": kmMaxAcelerador,
        "km_max_vela": kmMaxVela,
        "km_max_freio": kmMaxFreio,
        "km_max_embreagem": kmMaxEmbreagem,
        "km_max_pneus": kmMaxPneus,
        "km_max_suspensao": kmMaxSuspensao,
      };
}
