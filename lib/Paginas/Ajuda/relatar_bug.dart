import 'package:flutter/material.dart';
import 'package:mymoto/Componentes/campo_de_texto_formulario_customizado.dart';

class RelatarBug extends StatefulWidget {
  @override
  _RelatarBugState createState() => _RelatarBugState();
}

class _RelatarBugState extends State<RelatarBug> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reporte um bug",
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
            SizedBox(
              height: 22,
            ),
            TextField(
              maxLength: 10,
              maxLines: 1,
              decoration: InputDecoration(
                labelText: 'Modelo do aparelho',
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
            TextField(
              maxLength: 10,
              maxLines: 1,
              decoration: InputDecoration(
                labelText: 'Versão do android',
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

            Text("Relatar problema"),
            SizedBox(height: 6,),

            TextField(
              maxLength: 140,
              maxLines: 10,
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
