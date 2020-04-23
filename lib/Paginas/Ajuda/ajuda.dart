import 'package:flutter/material.dart';

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
              title: Text("exemplo 1 "),
            ),
            ListTile(
              title: Text("exemplo 2 "),
            ),
            ListTile(
              title: Text("exemplo 3"),
            ),
          ],
        ),
      ),
    );
  }
}
