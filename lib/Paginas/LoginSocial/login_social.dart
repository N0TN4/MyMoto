import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mymoto/Autenticacao/autenticacao_google.dart';
import 'package:mymoto/Componentes/campo_de_texto_formulario_customizado.dart';
import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';
import 'package:mymoto/Paginas/LoginSocial/login_social_bloc.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mymoto/Paginas/MenuPrincipal/menu_principal.dart';

class LoginSocial extends StatefulWidget {
  @override
  _LoginSocialState createState() => _LoginSocialState();
}

class _LoginSocialState extends State<LoginSocial> {
  TextEditingController _loginController = new TextEditingController();
  TextEditingController _senhaController = new TextEditingController();
  BlocLoginSocial _bloc = new BlocLoginSocial();

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  

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
              controlador: _loginController,
              bloc: _bloc.mudarLogin(_loginController.text),
              rotulo: "Login",
            ),
          ),
          Container(
            child: CampoDeTextoFormularioCustomizado(
              controlador: _senhaController,
              bloc: _bloc.mudarSenha(_senhaController.text),
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
                    onChanged: (check) {},
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
                        onPressed: _bloc.salvar)),
              ],
            ),
          ),
          GoogleSignInButton(
            text: "Login",
            onPressed: () async {
              AutenticacaoGoogle autenticacao = new AutenticacaoGoogle();
              await autenticacao.logarComGoogle();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuPrincipal()));

              /* _handleSignIn().then((FirebaseUser user) {
                print(user);
                

              }).catchError((e) => print(e));
            */
            },
          ),
        ],
      ),
    );
  }
}
