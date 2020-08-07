import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'package:mymoto/Componentes/campo_de_texto_formulario_customizado.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';

class EditarPerfil extends StatefulWidget {
  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  TextEditingController usuarioController = new TextEditingController();
  TextEditingController nomeController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController senhaController = new TextEditingController();
  TextEditingController telefoneController = new TextEditingController();

  @override
  initState() {
    super.initState();
    usuarioController.text = UsuarioLogado.usuario.login;
    nomeController.text = UsuarioLogado.usuario.nome;
    emailController.text = UsuarioLogado.usuario.email;
    senhaController.text = UsuarioLogado.usuario.senha;
    telefoneController.text = UsuarioLogado.usuario.telefone;
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
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Text(
                    "Seus dados pessoais:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              CampoDeTextoFormularioCustomizado(
                rotulo: "Nome",
                required: true,
                controlador: nomeController,
              ),
              Divider(
                height: 20.0,
                color: Colors.white10,
              ),
              CampoDeTextoFormularioCustomizado(
                rotulo: "E-mail",
                tipoDoInput: TextInputType.emailAddress,
                required: true,
                controlador: emailController,
              ),
              Divider(
                height: 20.0,
                color: Colors.white10,
              ),
              CampoDeTextoFormularioCustomizado(
                rotulo: "Telefone",
                tipoDoInput: TextInputType.number,
                controlador: telefoneController,
              ),
              Divider(
                height: 20.0,
                color: Colors.white10,
              ),
              Divider(height: 20.0, color: Colors.white10),
              Divider(height: 60.0, color: Colors.white10),
              RaisedButton.icon(
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                color: Colors.red,
                label: Text(
                  "Voltar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
