import 'package:mymoto/Paginas/EnviarFeedback/feedback_services.dart';
import 'package:mymoto/Paginas/EnviarFeedback/feedback_model.dart';
import 'package:rxdart/rxdart.dart';

class FeedbackBloc {
  final _mensagemDoUsuario = BehaviorSubject<String>();
  
  Function(String) get setMensagemDoUsuario => _mensagemDoUsuario.sink.add;

  FeedbackServices _services = new FeedbackServices();
  

  Future<bool> enviarMensagem() async {
    FeedBackModel feedback = new FeedBackModel();
    feedback.mensagemDoUsuario = _mensagemDoUsuario.value;
    
    print("${feedback.mensagemDoUsuario}");
    return await _services.enviarMensagem(feedback).then((response) {
      print("POST - $response");
      if (response != null) {
        
        return true;
      }
      else{
        return false;
      }
    });

  }

  void dispose() {
    _mensagemDoUsuario.close();
  }
}