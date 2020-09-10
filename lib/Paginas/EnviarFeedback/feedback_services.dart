import 'package:mymoto/Paginas/EnviarFeedback/feedback_model.dart';
import 'package:mymoto/services/abstract_services.dart';
import 'dart:convert' as json;

class FeedbackServices extends AbstractService {
  FeedbackServices() : super('/feedback');

  Future<dynamic> enviarMensagem(FeedBackModel feedback) {
    return Session.post('${AbstractService.staticAPI}/feedback',
            body: toJsonFeedback(feedback))
        .then((response) {
      print(response);
      print("JSON POST: ${json.jsonEncode(toJsonFeedback(feedback))}");
    });
  }

  Map<String, dynamic> toJsonFeedback(FeedBackModel feedback) => {
        "mensagemDoUsuario": feedback.mensagemDoUsuario,
        "titulo": feedback.titulo,
        "dataDeEnvio": feedback.dataEnvio.toIso8601String(),
        // "informacoesDoAparelho" : null,
      };

  @override
  fromJson(json) {
    return json;
  }

  @override
  fromJsonFeedBackModel(json) {
    return new FeedBackModel.fromJson(json);
  }
}
