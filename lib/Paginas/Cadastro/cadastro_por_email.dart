import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mymoto/Componentes/campo_de_texto_formulario_customizado.dart';
import 'package:mymoto/Paginas/Cadastro/cadastro_por_email_bloc.dart';
import 'package:mymoto/Paginas/MenuPrincipal/menu_principal.dart';
import 'package:masked_text/masked_text.dart';

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

  Widget botaoSelecaoModelo() {}

  Widget botaoSelecaoMarca() {
    String dropdownValue = 'Selecionar';

    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 20,
      isExpanded: true,
      style: TextStyle(color: Colors.red),
      underline: Container(
        height: 1,
        color: Colors.red,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'Selecionar',
        'Marca 1',
        'Marca 2',
        'Marca 3',
        'Marca 4',
        'Marca 5'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void voltarPagina(BuildContext context, Widget page) async {
    String s = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));

    print(">> $s");
  }

  valiadorSenhas(BuildContext context) {
    final senha = senhaCtrl.text;
    final confirmarSenha = confirmarSenhaCtrl.text;

    print("Login: $confirmarSenha , Senha: $senha ");

    if (!formKey.currentState.validate()) {
      return;
    }

    if (confirmarSenha != senha) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Erro",
            ),
            content: Text(
              "As Senhas Não conrespondem",
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  validadorVazio(String text) {
    if (text.isEmpty) {
      return "Informe um(a) $text";
    }
    return null;
  }

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
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 40.0,
            semanticLabel: "voltar",
          ),
          onPressed: () => voltarPagina(context, MenuPrincipal()),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Center(
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
                  Expanded(
                    child: Text(
                      "Modelo",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  Expanded(
                    child: botaoSelecaoModelo(),
                  ),
                  CampoDeTextoFormularioCustomizado(
                    rotulo: "Nome",
                    required: true,
                    key: formKey,
                    controlador: nomeCtrl,
                    campoSubmetido: validadorVazio("Nome"),
                    bloc: _bloc.mudarNome(nomeCtrl.text),
                  ),
                  CampoDeTextoFormularioCustomizado(
                    rotulo: "E-mail",
                    tipoDoInput: TextInputType.emailAddress,
                    controlador: emailCtrl,
                    key: formKey,
                    required: true,
                    campoSubmetido: validadorVazio("E-mail"),
                    bloc: _bloc.mudarEmail(emailCtrl.text),
                  ),
                  CampoDeTextoFormularioCustomizado(
                    rotulo: "Senha",
                    obscureText: true,
                    required: true,
                    campoSubmetido: validadorVazio("Senha"),
                    key: formKey,
                    controlador: senhaCtrl,
                    bloc: _bloc.mudarSenha(senhaCtrl.text),
                  ),
                  CampoDeTextoFormularioCustomizado(
                    rotulo: "Confirmar senha",
                    obscureText: true,
                    required: true,
                    key: formKey,
                    campoSubmetido: validadorVazio("Confirmar Senha"),
                    controlador: confirmarSenhaCtrl,
                    bloc: _bloc.mudarConfirmarSenhar(confirmarSenhaCtrl.text),
                  ),
                  CampoDeTextoFormularioCustomizado(
                    rotulo: "Telefone",
                    tipoDoInput: TextInputType.number,
                    controlador: telefoneCtrl,
                    required: true,
                    key: formKey,
                    campoSubmetido: validadorVazio("Telefone"),
                    bloc: _bloc.mudarTelefone(telefoneCtrl.text),
                    mask: "(xx) x xxxx-xxxx",
                    maskedTextFieldController: textTelefoneCtrl,
                    linhasMax: 14,
                  ),
                  Row(
                    children: <Widget>[
                      StreamBuilder(
                          stream: Firestore.instance
                              .collection('motos')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return new Text('Error: ${snapshot.error}');
                            }
                            if (snapshot.hasData) {
                              DocumentSnapshot ds = snapshot.data.documents[0];
                              //mostra  a marca da moto que está no documento do firebase
                              //a variavel ds tem o array 0 ou seja, honda.

                              print(ds['marca']);
                              return Expanded(
                                child: Text(
                                  "Modelo",
                                  style: TextStyle(color: Colors.red),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                      Expanded(
                        child: botaoSelecaoModelo(),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Marca",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Expanded(
                        child: botaoSelecaoMarca(),
                      ),
                    ],
                  ),
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
                      _bloc.salvar();
                      valiadorSenhas(context);
                      print("login: ${loginCtrl.text}" +
                          " nome: ${nomeCtrl.text}" +
                          " email : ${emailCtrl.text}" +
                          " senha: ${senhaCtrl.text}" +
                          " confirmar senha : ${confirmarSenhaCtrl.text}" +
                          " telefone: ${telefoneCtrl.text}");
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
