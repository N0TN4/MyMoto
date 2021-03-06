import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mymoto/Componentes/CampoDeTextoSenhaCustomizado.dart';
import 'package:mymoto/Componentes/caixa_de_selecao.dart';
import 'package:mymoto/Componentes/campo_de_texto_formulario_customizado.dart';
import 'package:mymoto/Cores/cores.dart';
import 'package:mymoto/Paginas/Cadastro/cadastro_por_email_bloc.dart';
import 'package:mymoto/Paginas/MenuPrincipal/menu_principal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroPorEmail extends StatefulWidget {
  // receber firebase user
  final FirebaseUser usuarioSocial;
  const CadastroPorEmail({this.usuarioSocial});
  @override
  _CadastroPorEmailState createState() => _CadastroPorEmailState();
}

class _CadastroPorEmailState extends State<CadastroPorEmail> {
  TextEditingController loginCtrl = TextEditingController();
  TextEditingController nomeCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController senhaCtrl = TextEditingController();
  TextEditingController confirmarSenhaCtrl = TextEditingController();
  TextEditingController telefoneCtrl = TextEditingController();
  TextEditingController textTelefoneCtrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode focoLogin = FocusNode();
  FocusNode focoNome = FocusNode();
  FocusNode focoEmail = FocusNode();
  FocusNode focoSenha = FocusNode();
  FocusNode focoConfirmarSenha = FocusNode();
  FocusNode focoTelefone = FocusNode();
  //FocusNode focoLogin = FocusNode();

  BlocCadastroPorEmail _bloc = BlocCadastroPorEmail();
  final _formularioChave = GlobalKey<FormState>();

  String kmDiaria = '';
  @override
  void dispose() {
    focoLogin.dispose();
    focoNome.dispose();
    focoEmail.dispose();
    focoSenha.dispose();
    focoConfirmarSenha.dispose();
    focoTelefone.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _bloc.getMotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _pularLinha({double valor}) {
      return SizedBox(
        height: valor == null ? 16 : valor,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastro",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Form(
            key: _formularioChave,
            child: Column(
              children: <Widget>[
                // CampoDeTextoFormularioCustomizado(
                //   label: "Login",
                //   required: true,
                //   controlador: loginCtrl,
                //   linhasMax: 1,
                //   focusNode: focoLogin,
                //   campoSubmetido: (txt) {
                //     _bloc.mudarLogin(txt);
                //     _alterarFoco(context, focoLogin, focoNome);
                //   },
                //   bloc: _bloc.mudarLogin(loginCtrl.text),
                // ),
                // _pularLinha(),
                CampoDeTextoFormularioCustomizado(
                  label: "Nome",
                  required: true,
                  controlador: nomeCtrl,
                  linhasMax: 1,
                  focusNode: focoNome,
                  campoSubmetido: (txt) {
                    _bloc.mudarNome(txt);
                    _alterarFoco(context, focoNome, focoEmail);
                  },
                  onChanged: (text) {
                    _bloc.mudarNome(text);
                  },
                ),
                _pularLinha(),
                CampoDeTextoFormularioCustomizado(
                  label: "E-mail",
                  tipoDoInput: TextInputType.emailAddress,
                  controlador: emailCtrl,
                  linhasMax: 1,
                  required: true,
                  focusNode: focoEmail,
                  campoSubmetido: (txt) {
                    _bloc.mudarEmail(txt);
                    _alterarFoco(context, focoEmail, focoSenha);
                  },
                  onChanged: (text) {
                    _bloc.mudarEmail(text);
                  },
                ),
                _pularLinha(),
                CampoDeTextoSenhaCustomizado(
                  labelText: "Senha",
                  required: true,
                  maxLines: 1,
                  controller: senhaCtrl,
                  focusNode: focoSenha,
                  onFieldSubmitted: (txt) {
                    _bloc.mudarSenha(senhaCtrl.text);
                    _alterarFoco(context, focoSenha, focoConfirmarSenha);
                  },
                  onChanged: (text) {
                    _bloc.mudarSenha(text);
                  },
                ),
                _pularLinha(),
                // CampoDeTextoSenhaCustomizado(
                //     labelText: "Confirmar senha",
                //     required: true,
                //     maxLines: 1,
                //     controller: confirmarSenhaCtrl,
                //     focusNode: focoConfirmarSenha,
                //     onFieldSubmitted: (txt) {
                //       _bloc.mudarConfirmarSenhar(confirmarSenhaCtrl.text);
                //       _alterarFoco(context, focoConfirmarSenha, focoTelefone);
                //     }),
                // _pularLinha(),
                CampoDeTextoFormularioCustomizado(
                  label: "Telefone",
                  tipoDoInput: TextInputType.number,
                  controlador: telefoneCtrl,
                  linhasMax: 1,
                  focusNode: focoTelefone,
                  campoSubmetido: (txt) {
                    focoTelefone.unfocus();
                  },
                  onChanged: (text) {
                    _bloc.mudarTelefone(text);
                  },
                ),
                _pularLinha(),

                SizedBox(height: 10),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Text("Insira os dados da sua motocicleta",
                            style: TextStyle(
                                fontSize: 19,
                                color: corSecundaria,
                                fontWeight: FontWeight.w600)),
                        SizedBox(height: 20),
                        StreamBuilder<List<String>>(
                            stream: _bloc.nomeMoto,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Container();
                              } else {
                                String valorMoto = snapshot.data[0];
                                return Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Moto:",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 17),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: CaixaDeSelecao(
                                        value: valorMoto,
                                        options: snapshot.data,
                                        onChanged: (valor) {
                                          setState(() {
                                            valorMoto = valor;
                                            _bloc.selecionarMoto(valor);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              }
                            }),
                        _pularLinha(),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Text(
                                "Media km diária:",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 17),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: CaixaDeSelecao(
                                value: "30",
                                options: [
                                  "10",
                                  "15",
                                  "30",
                                  "50",
                                  "75",
                                  "100",
                                  "150",
                                  "200",
                                ],
                                onChanged: (valor) {
                                  setState(() {
                                    kmDiaria = valor;
                                    _bloc.mudarkmDiariaSelecionada(
                                        num.parse(valor));
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        _pularLinha(),
                      ],
                    ),
                  ),
                ),

                Divider(height: 60.0, color: Colors.white10),
                RaisedButton.icon(
                  icon: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  color: Colors.red,
                  label: Text(
                    "Confirmar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    // if (!confirmarSenhaCtrl.text.contains(senhaCtrl.text)) {
                    //   print("senhas divergentes");
                    //   msg(false);
                    // }
                    if (_formularioChave.currentState.validate()) {
//  login true cadastrado
                      //loginUser

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
                        // widget.usuarioSocial.uid;
                        // if(usuarioSocial != null ){

                        // }
                        return _bloc
                            .salvar(usuarioSocial: widget.usuarioSocial)
                            .then((cadastrado) async {
                          //msg(cadastrado);
                          if (cadastrado) {
                            await loginUser();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuPrincipal()));
                          } else {
                            Navigator.of(context).pop();
                          }
                        });
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _alterarFoco(
      BuildContext context, FocusNode focoAtual, FocusNode proximoFoco) {
    focoAtual.unfocus();
    FocusScope.of(context).requestFocus(proximoFoco);
  }

  msg(bool logado) {
    if (logado) {
      Timer(Duration(seconds: 2), () {
        Navigator.of(context).pop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MenuPrincipal()));
      });
      return showDialog(
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
    } else {
      Timer(Duration(seconds: 1), () {
        Navigator.of(context).pop();
      });
      return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          content: new Text("Não foi possível cadastrar"),
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
    prefs.setString('email', emailCtrl.text);
    prefs.setString('senha', senhaCtrl.text);
    print(
        "auto login : ${prefs.getString('email')} e ${prefs.getString('senha')}");
  }
}
