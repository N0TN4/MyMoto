import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mymoto/Componentes/caixa_de_selecao.dart';
import 'package:mymoto/Componentes/campo_de_texto_formulario_customizado.dart';
import 'package:mymoto/Paginas/Cadastro/cadastro_por_email_bloc.dart';
import 'package:mymoto/Paginas/MenuPrincipal/menu_principal.dart';

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

  BlocCadastroPorEmail _bloc = BlocCadastroPorEmail();
  final _formularioChave = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                  rotulo: "Login",
                  required: true,
                  controlador: loginCtrl,
                  bloc: _bloc.mudarLogin(loginCtrl.text),
                ),
                Divider(
                  height: 20.0,
                  color: Colors.white10,
                ),
                CampoDeTextoFormularioCustomizado(
                  rotulo: "Nome",
                  required: true,
                  controlador: nomeCtrl,
                  bloc: _bloc.mudarNome(nomeCtrl.text),
                ),
                Divider(
                  height: 20.0,
                  color: Colors.white10,
                ),
                CampoDeTextoFormularioCustomizado(
                  rotulo: "E-mail",
                  tipoDoInput: TextInputType.emailAddress,
                  controlador: emailCtrl,
                  required: true,
                  bloc: _bloc.mudarEmail(emailCtrl.text),
                ),
                Divider(
                  height: 20.0,
                  color: Colors.white10,
                ),
                CampoDeTextoFormularioCustomizado(
                  rotulo: "Senha",
                  required: true,
                  obscureText: true,
                  controlador: senhaCtrl,
                  bloc: _bloc.mudarSenha(senhaCtrl.text),
                ),
                Divider(
                  height: 20.0,
                  color: Colors.white10,
                ),
                CampoDeTextoFormularioCustomizado(
                  rotulo: "Confirmar senha",
                  required: true,
                  obscureText: true,
                  controlador: confirmarSenhaCtrl,
                  bloc: _bloc.mudarConfirmarSenhar(confirmarSenhaCtrl.text),
                ),
                Divider(
                  height: 20.0,
                  color: Colors.white10,
                ),
                CampoDeTextoFormularioCustomizado(
                  rotulo: "Telefone",
                  tipoDoInput: TextInputType.number,
                  controlador: telefoneCtrl,
                  bloc: _bloc.mudarTelefone(telefoneCtrl.text),
                ),
                Divider(
                  height: 20.0,
                  color: Colors.white10,
                ),
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
                Divider(height: 20.0, color: Colors.white10),
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
}
