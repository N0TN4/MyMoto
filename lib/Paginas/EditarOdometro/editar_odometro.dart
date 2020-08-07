import 'package:flutter/material.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';

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

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Text(
                  "Olá ${UsuarioLogado.usuario.nome}, aqui estão as informações atuais sobre a sua moto de cadastro.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),

            //retirar center
            // adicionar padding no text
            // padding : EdgeInsects.only(top : 20 ),
            // MediaQuery.of(context).size.height - 100
            // pintar de vermelho
            Card(
              child: ListTile(
                title: Text(
                  "${UsuarioLogado.usuario.moto.nome ?? ""}",
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(
                    "${UsuarioLogado.usuario.moto.mediaDiariaKm ?? ""} km/dia\n" +
                        "Ultima modificação : ${UsuarioLogado.usuario.moto.dataDeAlteracao.day}/${UsuarioLogado.usuario.moto.dataDeAlteracao.month}/${UsuarioLogado.usuario.moto.dataDeAlteracao.year}"),
                leading: Icon(Icons.motorcycle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
