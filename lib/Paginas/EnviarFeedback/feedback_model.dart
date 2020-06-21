import 'dart:convert';

FeedBackModel feedbackFromJson(String str) => FeedBackModel.fromJson(json.decode(str));

String feedbackToJson(FeedBackModel data) => json.encode(data.toJson());

class FeedBackModel {
  int id;
  String titulo;
  String mensagemDoUsuario;
  String informacoesDoAparelho;
  DateTime dataEnvio;

  FeedBackModel({
    this.id,
    this.titulo,
    this.mensagemDoUsuario,
    //this.informacoesDoAparelho,
    //this.dataEnvio,
  });

  factory FeedBackModel.fromJson(Map<String, dynamic> json) => FeedBackModel(
        id: json["id"],
        titulo: json["titulo"],
        mensagemDoUsuario: json["mensagemDoUsuario"],
        //informacoesDoAparelho: json["informacoesDoAparelho"],
        //dataEnvio: DateTime.parse(json["dataEnvio"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo" : titulo,
        "mensagemDoUsuario": mensagemDoUsuario,
        //"informacoesDoAparelho": informacoesDoAparelho,
        //s"dataEnvio": dataEnvio.toIso8601String(),
      };
}