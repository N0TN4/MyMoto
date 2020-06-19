import 'package:mymoto/Paginas/EnviarFeedback/obter_informacoes_aparelho.dart';
import 'package:mymoto/Paginas/EnviarFeedback/relatar_feedback.dart';
import 'package:mymoto/services/abstract_services.dart';
import 'dart:convert' as json;

class FeedbackServices extends AbstractService {
  FeedbackServices() : super('/feedback');

  Future<dynamic> enviarMensagem(RelatarFeedback relatar, InformacoesAparelho aparelho){
    return Session.post('${AbstractService.staticAPI}/feedback',
      body: toJsonFeedback(relatar, aparelho)).then((response){
        print(response);
        print("JSON POST: ${json.jsonEncode(toJsonFeedback(relatar, aparelho))}");
      });
  }
  Map<String, dynamic> toJsonFeedback(RelatarFeedback relatar, InformacoesAparelho aparelho) => {
    "mensagemDoUsuario" : relatar,
    "dataDeEnvio" : relatar,
    "informacoesDoAparelho" : aparelho.deviceData,
  };

  @override
  fromJson(json) {
    return json;
  }

  @override
  fromJsonUsuario(json) {
    return json;
  }

}