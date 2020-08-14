import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoto/Componentes/CampoDeTextoSenhaCustomizado.dart';
import 'package:mymoto/Componentes/campo_de_texto_formulario_customizado.dart';
import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/Paginas/Cadastro/cadastro_por_email.dart';
import 'package:mymoto/Paginas/LoginSocial/login_social_bloc.dart';
import 'package:mymoto/Paginas/MenuPrincipal/menu_principal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginSocial extends StatefulWidget {
  @override
  _LoginSocialState createState() => _LoginSocialState();
}

class _LoginSocialState extends State<LoginSocial> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _senhaController = new TextEditingController();
  BlocLoginSocial _bloc = new BlocLoginSocial();
  bool campoDeTextoDeSenhaAtivo = false;
  FocusNode focusNode = FocusNode();
  final _chaveFormulario = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    DateTime dataAtual = DateTime.now();
    print(dataAtual);
  }

  @override
  void dispose() {
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _chaveFormulario,
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
                        padding: const EdgeInsets.only(top: 70),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.motorcycle,
                              size: 90,
                            ),
                            Text(
                              "MyMoto",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 38),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: CampoDeTextoFormularioCustomizado(
                    controlador: _emailController,
                    linhasMax: 1,
                    required: true,
                    campoSubmetido: (str) {
                      focusNode.requestFocus();
                    },
                    bloc: _bloc.mudarLogin(_emailController.text),
                    label: "Email",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: CampoDeTextoSenhaCustomizado(
                    controller: _senhaController,
                    required: true,
                    onFieldSubmitted: _bloc.mudarSenha(_senhaController.text),
                    maxLines: 1,
                    focusNode: focusNode,
                    labelText: "Senha",
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 90,
                      padding: EdgeInsets.all(20),
                      child: RaisedButton(
                          color: Color(0xffF24333),
                          child: Text(
                            "ENTRAR",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            if (_chaveFormulario.currentState.validate()) {
                              Usuario usuario = new Usuario(
                                email: _emailController.text,
                                senha: _senhaController.text,
                              );
                              showDialog(
                                context: context,
                                builder: (context) => new AlertDialog(
                                  content: new Text("Carregando..."),
                                  actions: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: new CircularProgressIndicator(),
                                    ), // loading
                                  ],
                                ),
                              );
                              Timer(Duration(seconds: 2), () {
                                return _bloc.logar(usuario).then((logado) {
                                  // msg(logado);
                                  if (logado) {
                                    loginUser();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MenuPrincipal()));
                                  }
                                });
                              });
                              // await logar(
                              //     _loginController.text, _senhaController.text);
                            }
                          }),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 18.0, right: 13.0),
                        child: Divider(
                          color: Colors.black,
                          height: 20,
                        )),
                  ),
                  InkWell(
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CadastroPorEmail()));
                    },
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 18.0, right: 13.0),
                        child: Divider(
                          color: Colors.black,
                          height: 20,
                        )),
                  ),
                ],
              ),

              // GoogleSignInButton(
              //   text: "Login",
              //   onPressed: () async {
              //     AutenticacaoGoogle autenticacao = new AutenticacaoGoogle();
              //     autenticacao.logarComGoogle();
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => MenuPrincipal()));
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  msg(bool logado) {
    if (logado) {
      return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          content: new Text("Carregando..."),
          actions: <Widget>[],
        ),
      );
    } else {
      return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          content: new Text("Não foi possível conectar"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new CircularProgressIndicator(),
            ), // loading
          ],
        ),
      );
    }
  }

  Future<Null> loginUser() async {
    print("AUTO LOGIN");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', _emailController.text);
    prefs.setString('senha', _senhaController.text);
  }
}
