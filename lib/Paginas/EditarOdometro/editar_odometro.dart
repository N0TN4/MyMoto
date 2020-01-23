import 'package:flutter/material.dart';

class EditarOdometro extends StatefulWidget {
  @override
  _EditarOdometroState createState() => _EditarOdometroState();
}

class _EditarOdometroState extends State<EditarOdometro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Editar informações",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // retirar divider

            Divider(
              height: 50,
              color: Colors.white,
            ),

            //retirar center
            // adicionar padding no text
            // padding : EdgeInsects.only(top : 20 ),
            // MediaQuery.of(context).size.height - 100
            // pintar de vermelho

            Center(
              child: Text(
                "Moto 150cc",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
