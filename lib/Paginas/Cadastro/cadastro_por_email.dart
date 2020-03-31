import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mymoto/Componentes/CampoDeTextoSenhaCustomizado.dart';
import 'package:mymoto/Componentes/caixa_de_selecao.dart';
import 'package:mymoto/Componentes/campo_de_texto_formulario_customizado.dart';
import 'package:mymoto/Paginas/Cadastro/cadastro_por_email_bloc.dart';

class CadastroPorEmail extends StatefulWidget {
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
                CampoDeTextoFormularioCustomizado(
                  label: "Login",
                  required: true,
                  controlador: loginCtrl,
                  linhasMax: 1,
                  focusNode: focoLogin,
                  campoSubmetido: (txt) {
                    _alterarFoco(context, focoLogin, focoNome);
                  },
                  //bloc: _bloc.mudarLogin(loginCtrl.text),
                ),
                _pularLinha(),
                CampoDeTextoFormularioCustomizado(
                  label: "Nome",
                  required: true,
                  controlador: nomeCtrl,
                  linhasMax: 1,
                  focusNode: focoNome,
                  campoSubmetido: (txt) {
                    _alterarFoco(context, focoNome, focoEmail);
                  },
                  //bloc: _bloc.mudarNome(nomeCtrl.text),
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
                    _alterarFoco(context, focoEmail, focoSenha);
                  },
                  //bloc: _bloc.mudarEmail(emailCtrl.text),
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
                    }),
                _pularLinha(),
                CampoDeTextoSenhaCustomizado(
                    labelText: "Confirmar senha",
                    required: true,
                    maxLines: 1,
                    controller: confirmarSenhaCtrl,
                    focusNode: focoConfirmarSenha,
                    onFieldSubmitted: (txt) {
                      _bloc.mudarConfirmarSenhar(confirmarSenhaCtrl.text);
                      _alterarFoco(context, focoConfirmarSenha, focoTelefone);
                    }),
                _pularLinha(),
                CampoDeTextoFormularioCustomizado(
                  label: "Telefone",
                  tipoDoInput: TextInputType.number,
                  controlador: telefoneCtrl,
                  linhasMax: 1,
                  focusNode: focoTelefone,
                  campoSubmetido: (txt) {
                    focoTelefone.unfocus();
                  },
                  bloc: _bloc.mudarTelefone(telefoneCtrl.text),
                ),
                _pularLinha(),
                Row(
                  children: <Widget>[
                    StreamBuilder(
                        stream:
                            Firestore.instance.collection('motos').snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return new Text('Error: ${snapshot.error}');
                          }
                          if (snapshot.hasData) {
                            DocumentSnapshot ds = snapshot.data.documents[0];
                            //mostra  a marca da moto que está no documento do firebase
                            //a variavel ds tem o array 0 ou seja, honda.

                            print(ds['marca']);
                            return Row(
                              children: <Widget>[
                                Text(
                                  "Modelo",
                                  style: TextStyle(color: Colors.red),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                CaixaDeSelecao(
                                  value: "Selecione",
                                  options: [
                                    "Selecione",
                                    ds['marca'],
                                  ],
                                  onChanged: (valor) {
                                    _bloc.mudarModelo(valor);
                                    print("PRINT VALOR $valor");
                                  },
                                ),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        }),
                  ],
                ),
                _pularLinha(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Marca",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    // Expanded(
                    //   child: botaoSelecaoMarca(),
                    // ),
                  ],
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
                  onPressed: () {
                    if (!confirmarSenhaCtrl.text.contains(senhaCtrl.text)) {
                      print("senhas divergentes");
                    }
                    if (_formularioChave.currentState.validate()) {
                      _bloc.salvar();
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
}
