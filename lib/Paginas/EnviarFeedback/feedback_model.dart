import 'dart:convert';

FeedBackModel feedBackModelFromJson(String str) => FeedBackModel.fromJson(json.decode(str));

String feedBackModelToJson(FeedBackModel data) => json.encode(data.toJson());

class FeedBackModel {
    FeedBackModel({
        this.id,
        this.mensagemDoUsuario,
        this.informacoesDoAparelho,
        this.dataDeEnvio,
    });

    int id;
    String mensagemDoUsuario;
    String informacoesDoAparelho;
    DateTime dataDeEnvio;

    factory FeedBackModel.fromJson(Map<String, dynamic> json) => FeedBackModel(
        id: json["id"],
        mensagemDoUsuario: json["mensagemDoUsuario"],
        informacoesDoAparelho: json["informacoesDoAparelho"],
        dataDeEnvio: DateTime.parse(json["dataDeEnvio"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "mensagemDoUsuario": mensagemDoUsuario,
        "informacoesDoAparelho": informacoesDoAparelho,
        "dataDeEnvio": dataDeEnvio.toIso8601String(),
    };
}