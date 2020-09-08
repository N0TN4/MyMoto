import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:mymoto/Autenticacao/autenticacao_google.dart';
import 'package:mymoto/Componentes/CampoDeTextoSenhaCustomizado.dart';
import 'package:mymoto/Componentes/campo_de_texto_formulario_customizado.dart';
import 'package:mymoto/Cores/cores.dart';
import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';
import 'package:mymoto/Paginas/Cadastro/cadastro_por_email.dart';
import 'package:mymoto/Paginas/LoginSocial/login_social_bloc.dart';
import 'package:mymoto/Paginas/MenuPrincipal/menu_principal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginSocial extends StatefulWidget {
  @override
  _LoginSocialState createState() => _LoginSocialState();
}

class _LoginSocialState extends State<LoginSocial> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  BlocLoginSocial _bloc = BlocLoginSocial();
  bool campoDeTextoDeSenhaAtivo = false;
  FocusNode focusNode = FocusNode();
  final _chaveFormulario = GlobalKey<FormState>();
  AutenticacaoGoogle autenticacaoGoogle = AutenticacaoGoogle();

  @override
  void initState() {
    super.initState();
    DateTime dataAtual = DateTime.now();
    logarAutomaticamente();
    print(dataAtual);
  }

  @override
  void dispose() {
    focusNode.dispose();

    super.dispose();
  }

  logarAutomaticamente() async {
    final prefs = await SharedPreferences.getInstance();
    String emailUsuario = prefs.getString("email");
    String senhaUsuario = prefs.getString("senha");
    if (emailUsuario != null || senhaUsuario != null) {
      Usuario usuario = new Usuario(
        email: emailUsuario,
        senha: senhaUsuario,
      );
      showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          content: new Text("Entrando..."),
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MenuPrincipal()));
          }
        });
      });
    }
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
                height: MediaQuery.of(context).size.height / 3.5,
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
                              " MyMoto",
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
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(12.0),
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
                padding: const EdgeInsets.all(12.0),
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
                  Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
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
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 11, right: 12),
                        child: Divider(
                          color: Colors.black,
                          height: 20,
                        )),
                  ),
                  Text(
                    " Não tem conta?  ",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: corSecundaria,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            " Cadastre-se",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade100),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CadastroPorEmail()));
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 12, right: 11),
                        child: Divider(
                          color: Colors.black,
                          height: 20,
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GoogleSignInButton(
                  text: "Entrar com o Google",
                  onPressed: () async {
                    await autenticacaoGoogle
                        .logarComGoogle()
                        .then((usuarioSocial) async {
                      // verifica na base se o usuario tem um uid
                      await _bloc
                          .verificarUsuarioToken(usuarioSocial.uid)
                          .then((value) {
                        if (value != null) {
                          if (value.tokenUid == usuarioSocial.uid) {
                            Usuario usuario = new Usuario(
                              email: value.email,
                              senha: value.senha,
                            );

                            return _bloc.logar(usuario).then((logado) {
                              // msg(logado);
                              if (logado) {
                                loginUser();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MenuPrincipal()));
                              }
                            });
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CadastroPorEmail(
                                      usuarioSocial: usuarioSocial),
                                ));
                          }
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CadastroPorEmail(
                                    usuarioSocial: usuarioSocial),
                              ));
                        }
                      });
                    });
                  },
                ),
              ),
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
