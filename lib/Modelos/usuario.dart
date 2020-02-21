// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  String id;
  String senha;
  String telefone;
  String nome;
  String login;
  String modelo;
  String email;
  String linkFoto;

  Usuario({
    this.senha,
    this.telefone,
    this.nome,
    this.login,
    this.modelo,
    this.email,
  });

  Usuario.firebase({this.id, this.nome, this.email, this.linkFoto});

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        senha: json["senha"],
        telefone: json["telefone"],
        nome: json["nome"],
        login: json["login"],
        modelo: json["modelo"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "senha": senha,
        "telefone": telefone,
        "nome": nome,
        "login": login,
        "modelo": modelo,
        "email": email,
      };
}
