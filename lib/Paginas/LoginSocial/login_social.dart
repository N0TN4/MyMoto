import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoto/Autenticacao/autenticacao_google.dart';
import 'package:mymoto/Componentes/CampoDeTextoSenhaCustomizado.dart';
import 'package:mymoto/Componentes/campo_de_texto_formulario_customizado.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Ou conecte usando",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: MediaQuery.of(context).size.width / 3.8,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/icon_google.png", height: 26),
                        SizedBox(width: 10),
                        Material(
                          child: InkWell(
                            onTap: () async {
                              await autenticacaoGoogle.logarComGoogle();
                              if (autenticacaoGoogle.getCurrentUser() != null) {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CadastroPorEmail(),
                                    ));
                              }
                              //final autenticacao =
                              //    autenticaoGoogle.getCurrentUser();
                              // primeiro cadastro > uid
                              // passar tela cadastro firebase user
                              // usuarioSocial retorno da authenticação google

                              // request nossa rota api se o token de uid já existe na base
                              // caso sim chamar método login
                              // caso não chama cadastro passando o uid como parametro para ser cadastrado no post.
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => CadastroPorEmail(
                              //             usuarioSocial: autenticacao)));
                            },
                            child: Text("Google",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 11, right: 8),
                        child: Divider(
                          color: Colors.black,
                          height: 20,
                        )),
                  ),
                  Text(
                    "Não tem conta?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      " Cadastre-se",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500,
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
                        margin: const EdgeInsets.only(left: 8, right: 11),
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
