import 'package:flutter/material.dart';
import 'package:mymoto/Paginas/EnviarFeedback/feeback_bloc.dart';

class RelatarFeedback extends StatefulWidget {
  @override
  _RelatarFeedbackState createState() => _RelatarFeedbackState();
}

class _RelatarFeedbackState extends State<RelatarFeedback> {
  FeedbackBloc _bloc = new FeedbackBloc();
  final _ctrlEnviarTitulo = TextEditingController();
  final _ctrlEnviarMensagem = TextEditingController();
  final _chaveFormulario = GlobalKey<FormState>();
  final _chaveScaffold = GlobalKey<ScaffoldState>();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _chaveScaffold,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () async {
                _validacaoFormulario();
                if (_chaveFormulario.currentState.validate()) {
                  _bloc.enviarMensagem();
                }
              }),
        ],
        title: Text(
          "Ajuda",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _chaveFormulario,
          child: Column(
            children: <Widget>[
              // StreamBuilder<String>(
              //     stream: _bloc.mensagemDoUsuario,
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {

              //       } else {
              //         return Container();
              //       }
              //     }),
              const SizedBox(height: 24),
              TextFormField(
                //controller: _ctrlEnviarTitulo,
                validator: (valor) {
                  if (valor.isEmpty) {
                    return "Insira seu título";
                  }
                  return null;
                },
                maxLength: 50,
                maxLines: 1,
                decoration: InputDecoration(
                  counterText: "",
                  labelText: 'Título',
                  labelStyle: TextStyle(height: 0.0, color: Colors.red),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
                ),
              ),
              const SizedBox(height: 16),
              const Text("Feedback"),
              const SizedBox(height: 8),
              TextFormField(
                controller: _ctrlEnviarMensagem,
                //onFieldSubmitted : bloc.mensagemDoUsuario,
                validator: (valor) {
                  if (valor.isEmpty) {
                    return "Insira seu feedback";
                  }
                  return null;
                },
                maxLength: 1200,
                maxLines: 14,
                onChanged: (textoAlterado) {
                  _bloc.setMensagemDoUsuario(textoAlterado);
                },
                decoration: InputDecoration(
                  counterText: "",
                  labelStyle: TextStyle(height: 0.0, color: Colors.red),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _validacaoFormulario() {
    final _snackBar = SnackBar(content: Text("Campo não pode ser vazio."));
    if(!_chaveFormulario.currentState.validate()){
      return _chaveScaffold.currentState.showSnackBar(_snackBar);
    }
    print("feedback enviado");
    return Navigator.pop(context);
  }
  
  @override
  void dispose() {
    _ctrlEnviarTitulo.dispose();
    _ctrlEnviarMensagem.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
