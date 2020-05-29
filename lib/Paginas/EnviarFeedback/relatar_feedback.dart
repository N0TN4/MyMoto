import 'package:flutter/material.dart';
import 'package:mymoto/Paginas/EnviarFeedback/feeback_bloc.dart';

class RelatarFeedback extends StatefulWidget {
  @override
  _RelatarFeedbackState createState() => _RelatarFeedbackState();
}

class _RelatarFeedbackState extends State<RelatarFeedback> {
  FeedbackBloc bloc = new FeedbackBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: Column(
          children: <Widget>[
            StreamBuilder<String>(
                stream: bloc.mensagem,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data);
                  } 
                  else {
                    return Container();
                  }
                }),
            SizedBox(
              height: 22,
            ),
            TextField(
              maxLength: 260,
              maxLines: 10,
              onChanged: (textoAlterado) {
                bloc.setMensagem(textoAlterado);
              },
              decoration: InputDecoration(
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
            SizedBox(
              height: 12,
            ),
            RaisedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              color: Colors.red,
              label: Text(
                "Enviar",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
