// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  int id;
  String nome;
  String login;
  String email;
  String telefone;
  String senha;
  String tokenUid;
  String urlFoto;
  MotoModel moto;
  DateTime dataDeCriacao;
  DateTime dataDeAlteracao;

  Usuario({
    this.id,
    this.nome,
    this.login,
    this.email,
    this.telefone,
    this.senha,
    this.moto,
    this.tokenUid,
    this.urlFoto,
    this.dataDeCriacao,
    this.dataDeAlteracao,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        nome: json["nome"],
        login: json["login"],
        email: json["email"],
        tokenUid: json["tokenUid"],
        urlFoto: json["urlFoto"],
        telefone: json["telefone"],
        senha: json["senha"],
        moto: MotoModel.fromJson(json["moto"]),
        dataDeCriacao: DateTime.parse(json["dataDeCriacao"]),
        dataDeAlteracao: DateTime.parse(json["dataDeAlteracao"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "login": login,
        "email": email,
        "tokenUid": tokenUid,
        "urlFoto" : urlFoto,
        "telefone": telefone,
        "senha": senha,
        "moto": moto.toJson(),
        "dataDeCriacao": dataDeCriacao.toIso8601String(),
        "dataDeAlteracao": dataDeAlteracao.toIso8601String(),
      };
  Map<String, dynamic> toJsonAuth() => {
        "email": email,
        "senha": senha,
      };
}

class MotoModel {
  int id;
  String nome;
  String modelo;
  String marca;
  num cilindradas;
  num contadorDias;
  num mediaDiariaKm;
  num kmMaxTrocaOleo;
  num kmMaxAcelerador;
  num kmMaxVela;
  num kmMaxFreio;
  num kmMaxEmbreagem;
  num kmMaxPneus;
  num kmMaxSuspensao;
  num kmAtualTrocaOleo;
  num kmAtualAcelerador;
  num kmAtualVela;
  num kmAtualFreio;
  num kmAtualEmbreagem;
  num kmAtualPneus;
  num kmAtualSuspensao;
  dynamic usuario;
  num idUsuario;
  DateTime dataDeCriacao;
  DateTime dataDeAlteracao;

  MotoModel({
    this.id,
    this.nome,
    this.modelo,
    this.marca,
    this.cilindradas,
    this.contadorDias,
    this.mediaDiariaKm,
    this.kmMaxTrocaOleo,
    this.kmMaxAcelerador,
    this.kmMaxVela,
    this.kmMaxFreio,
    this.kmMaxEmbreagem,
    this.kmMaxPneus,
    this.kmMaxSuspensao,
    this.kmAtualTrocaOleo,
    this.kmAtualAcelerador,
    this.kmAtualVela,
    this.kmAtualFreio,
    this.kmAtualEmbreagem,
    this.kmAtualPneus,
    this.kmAtualSuspensao,
    this.usuario,
    this.idUsuario,
    this.dataDeCriacao,
    this.dataDeAlteracao,
  });

  factory MotoModel.fromJson(Map<String, dynamic> json) => MotoModel(
        id: json["id"],
        nome: json["nome"],
        modelo: json["modelo"],
        marca: json["marca"],
        cilindradas: json["cilindradas"],
        contadorDias: json["contador_dias"],
        mediaDiariaKm: json["media_diaria_km"],
        kmMaxTrocaOleo: json["km_max_troca_oleo"],
        kmMaxAcelerador: json["km_max_acelerador"],
        kmMaxVela: json["km_max_vela"],
        kmMaxFreio: json["km_max_freio"],
        kmMaxEmbreagem: json["km_max_embreagem"],
        kmMaxPneus: json["km_max_pneus"],
        kmMaxSuspensao: json["km_max_suspensao"],
        kmAtualTrocaOleo: json["km_atual_troca_oleo"],
        kmAtualAcelerador: json["km_atual_acelerador"],
        kmAtualVela: json["km_atual_vela"],
        kmAtualFreio: json["km_atual_freio"],
        kmAtualEmbreagem: json["km_atual_embreagem"],
        kmAtualPneus: json["km_atual_pneus"],
        kmAtualSuspensao: json["km_atual_suspensao"],
        usuario: json["usuario"],
        idUsuario: json["id_usuario"],
        dataDeCriacao: DateTime.parse(json["dataDeCriacao"]),
        dataDeAlteracao: DateTime.parse(json["dataDeAlteracao"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "modelo": modelo,
        "marca": marca,
        "cilindradas": cilindradas,
        "contador_dias": contadorDias,
        "media_diaria_km": mediaDiariaKm,
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
        "usuario": usuario,
        "id_usuario": idUsuario,
        "dataDeCriacao": dataDeCriacao.toIso8601String(),
        "dataDeAlteracao": dataDeAlteracao.toIso8601String(),
      };
}
