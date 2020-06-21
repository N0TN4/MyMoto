import 'package:flutter/material.dart';
import 'package:mymoto/Paginas/EnviarFeedback/feeback_bloc.dart';



class RelatarFeedback extends StatefulWidget {
  @override
  _RelatarFeedbackState createState() => _RelatarFeedbackState();
}

class _RelatarFeedbackState extends State<RelatarFeedback> {
  FeedbackBloc bloc = new FeedbackBloc();
  //final _ctrlEnviarTitulo = TextEditingController();
  final _ctrlEnviarMensagem = TextEditingController();
  final _chaveFormulario = GlobalKey<FormState>();

 @override
  void initState() {
    super.initState();
    bloc.initPlatformState().then((resposta){
      print(resposta);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () async {
              if (_chaveFormulario.currentState.validate()){
                bloc.enviarMensagem();
              }
              print("enviando feedback");
              }
          ),
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
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _chaveFormulario,
          child: Column(
            children: <Widget>[
              StreamBuilder<String>(
                  //stream: _bloc.
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data);
                    } else {
                      return Container();
                    }
                  }),
              SizedBox(height: 24.0),
              TextField(
                //controller: _ctrlEnviarTitulo,
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
              SizedBox(height: 16.0),
              Text("Feedback"),
              SizedBox(height: 8.0),
              TextField(
                controller: _ctrlEnviarMensagem,
                //onFieldSubmitted : bloc.mensagemDoUsuario, 
                maxLength: 1200,
                maxLines: 14,
                onChanged: (textoAlterado) {
                  bloc.setMensagemDoUsuario(textoAlterado);
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
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
