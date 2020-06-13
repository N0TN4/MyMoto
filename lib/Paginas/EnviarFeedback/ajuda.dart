import 'package:flutter/material.dart';
import 'package:mymoto/Paginas/EnviarFeedback/obter_informacoes_aparelho.dart';
import 'package:mymoto/Paginas/EnviarFeedback/relatar_bug.dart';
import 'package:mymoto/Paginas/EnviarFeedback/relatar_feedback.dart';


class Ajuda extends StatelessWidget {
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
      body: Container(
        child: Column(
          //
          children: <Widget>[
            ListTile(
              title: Text("Enviar feedback"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RelatarFeedback()));
              },
            ),
            ListTile(
              title: Text("Reporte um bug"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RelatarBug()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
