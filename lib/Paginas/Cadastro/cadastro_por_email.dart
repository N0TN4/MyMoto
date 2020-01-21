import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mymoto/Componentes/campo_de_texto_formulario_customizado.dart';
import 'package:mymoto/Paginas/MenuPrincipal/menu_principal.dart';

class CadastroPorEmail extends StatefulWidget {
  @override
  _CadastroPorEmailState createState() => _CadastroPorEmailState();
}

class _CadastroPorEmailState extends State<CadastroPorEmail> {

TextEditingController loginCtrl = TextEditingController();
TextEditingController nomeCtrl = TextEditingController();
TextEditingController emailCtrl = TextEditingController ();
TextEditingController senhaCtrl = TextEditingController ();
TextEditingController confirmarSenhaCtrl = TextEditingController();
TextEditingController telefoneCtrl = TextEditingController();

  Widget botaoSelecaoModelo() {
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
        'Modelo 1',
        'Modelo 2',
        'Modelo 3',
        'Modelo 4',
        'Modelo 5'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

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
              ),
              Divider(
                height: 20.0,
                color: Colors.white10,
              ),
              CampoDeTextoFormularioCustomizado(
                rotulo: "Nome",
                required: true,
                controlador: nomeCtrl,
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
              ),
              Divider(
                height: 20.0,
                color: Colors.white10,
              ),
              CampoDeTextoFormularioCustomizado(
                rotulo: "Senha",
                required: true,
                controlador: senhaCtrl,
              ),
              Divider(
                height: 20.0,
                color: Colors.white10,
              ),
              CampoDeTextoFormularioCustomizado(
                rotulo: "Confirmar senha",
                required: true,
                controlador: confirmarSenhaCtrl,
              ),
              Divider(
                height: 20.0,
                color: Colors.white10,
              ),
              CampoDeTextoFormularioCustomizado(
                rotulo: "Telefone",
                tipoDoInput: TextInputType.number,
                controlador: telefoneCtrl,
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
                ],
              ),
              Divider(height: 20.0, color: Colors.white10),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.red),
                ),
                onPressed: () {
                  /*funcao para calcular quilometragem*/
                },
                color: Colors.red,
                textColor: Colors.white,
                child: Text(
                  "Buy now".toUpperCase(),
                  style: TextStyle(fontSize: 14),
                ),
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
                  Expanded(
                    child: botaoSelecaoMarca(),
                  ),
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
                   print("login: ${loginCtrl.text}" + " nome: ${nomeCtrl.text}"
                    + " email : ${emailCtrl.text}" + " senha: ${senhaCtrl.text}"
                    + " confirmar senha : ${confirmarSenhaCtrl.text}" 
                    + " telefone: ${telefoneCtrl.text}");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
