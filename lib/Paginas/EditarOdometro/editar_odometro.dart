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
            Divider(
              height: 50,
              color: Colors.white,
            ),
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
