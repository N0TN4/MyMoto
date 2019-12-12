import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoto/Componentes/campo_de_texto_formulario_customizado.dart';

class LoginSocial extends StatefulWidget {
  @override
  _LoginSocialState createState() => _LoginSocialState();
}

class _LoginSocialState extends State<LoginSocial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffBA1B1D),
                    Color(0xffF24333),
                  ],
                ),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(90))),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.motorcycle,
                        size: 80,
                      ),
                      Text(
                        "MyMoto",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("Login"),
                )
              ],
            ),
          ),
          Container(
            child: CampoDeTextoFormularioCustomizado(
              rotulo: "Login",
            ),
          ),
          Container(
            child: CampoDeTextoFormularioCustomizado(
              rotulo: "Senha",
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Checkbox(
                    value: true,
                    checkColor: Color(0xffF24333),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Me lembre"),
                ),
                Expanded(
                    flex: 1,
                    child: RaisedButton(
                      color: Color(0xffF24333),
                      child: Text("Entrar"),
                      onPressed: () {},
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
