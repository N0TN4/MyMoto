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
  num cilindradas;
  num kmMaxTrocaOleo;
  num kmMaxAcelerador;
  num kmMaxVela;
  num kmMaxFreio;
  num kmMaxEmbreagem;
  num kmMaxPneus;
  num kmMaxSuspensao;
  int kmAtualTrocaOleo;
  int kmAtualAcelerador;
  int kmAtualVela;
  int kmAtualFreio;
  int kmAtualEmbreagem;
  int kmAtualPneus;
  int kmAtualSuspensao;

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
        "km_atual_troca_oleo": kmAtualTrocaOleo,
        "km_atual_acelerador": kmAtualAcelerador,
        "km_atual_vela": kmAtualVela,
        "km_atual_freio": kmAtualFreio,
        "km_atual_embreagem": kmAtualEmbreagem,
        "km_atual_pneus": kmAtualPneus,
        "km_atual_suspensao": kmAtualSuspensao,
      };
}
