import 'package:mymoto/Paginas/EnviarFeedback/feedback_model.dart';
import 'package:mymoto/services/abstract_services.dart';
import 'dart:convert' as json;

class FeedbackServices extends AbstractService {
  FeedbackServices() : super('/feedback');

  Future<dynamic> enviarMensagem(FeedBackModel feedback){
    return Session.post('${AbstractService.staticAPI}/feedback',
      body: feedback.toJson()).then((response){
        print(response);
        print("JSON POST: ${feedback.toJson()}");
      });
  }

  @override
  fromJson(json) {
    return json;
  }

  @override
  fromJsonFeedBackModel(json) {
    return new FeedBackModel.fromJson(json);
  }

}