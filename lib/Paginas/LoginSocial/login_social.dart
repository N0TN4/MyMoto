import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mymoto/Autenticacao/autenticacao_google.dart';
import 'package:mymoto/Componentes/campo_de_texto_formulario_customizado.dart';
import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';
import 'package:mymoto/Paginas/Cadastro/cadastro_por_email.dart';
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

  final _formularioLoginChave = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formularioLoginChave,
          child: Column(
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
                child: SingleChildScrollView(
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
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
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: CampoDeTextoFormularioCustomizado(
                    controlador: _loginController,
                    bloc: _bloc.mudarLogin(_loginController.text),
                    rotulo: "Login",
                    linhasMax: 1,
                    required: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: CampoDeTextoFormularioCustomizado(
                    controlador: _senhaController,
                    bloc: _bloc.mudarSenha(_senhaController.text),
                    //tipoDoInput: TextInputType.visiblePassword,
                    obscureText: true,
                    required: true,
                    linhasMax: 1,
                    rotulo: "Senha",
                  ),
                ),
              ),
              Row(  
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                        color: Color(0xffF24333),
                        child: Text("Cadastrar"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CadastroPorEmail()));
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                        color: Color(0xffF24333),
                        child: Text("Entrar"),
                        onPressed: () async {
                          if (_formularioLoginChave.currentState.validate()) {
                            logar(_loginController.text, _senhaController.text);
                          }
                        }),
                  ),
                ],
              ),
              GoogleSignInButton(
                text: "Login",
                onPressed: () async {
                  AutenticacaoGoogle autenticacao = new AutenticacaoGoogle();
                  autenticacao.logarComGoogle();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuPrincipal()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  logar(String login, String senha) {
    String loginAuxiliar;
    String senhaAuxiliar;
    Future<bool> futuro = Future(() => false); // inicializa logado como falso
    // consulta
    Firestore.instance
        .collection('usuarios')
        .where('login', isEqualTo: login)
        .snapshots()
        .listen((onData) {
      print(onData.documents[0].data);
      loginAuxiliar = onData.documents[0].data['login'];
      senhaAuxiliar = onData.documents[0].data['senha'];
      if (senha == senhaAuxiliar) {
        print("Sucesso");
        // dados usuario usuario =  from json
        UsuarioLogado.usuario = Usuario.fromJson(onData.documents[0].data);
        //Navigator.of(context).pop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MenuPrincipal()));
        //_bloc.dispose();
      } else {
        print("Senha errada.");
      }
    });
    //print("Logado ? $logado");
    //return logado;
  }
}
