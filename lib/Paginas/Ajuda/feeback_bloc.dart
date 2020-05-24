import 'package:rxdart/rxdart.dart';

class FeedbackBloc {
  final _mensagem = BehaviorSubject<String>();

  Stream<String> get mensagem => _mensagem.stream;

  Function(String) get setMensagem => _mensagem.sink.add;

  dispose() {
    _mensagem.close();
  }
}
