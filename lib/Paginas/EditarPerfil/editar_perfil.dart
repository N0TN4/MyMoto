import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'package:mymoto/Componentes/campo_de_texto_formulario_customizado.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';

import 'package:mymoto/Paginas/MenuPrincipal/menu_principal.dart';

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
              IconButton(
                icon: Icon(
                  Icons.person_add,
                ),
                iconSize: 100,
                alignment: Alignment.center,
                onPressed: () {
                  /*Funcao para adicionar uma foto */
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Foto do Perfil",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 20.0,
                color: Colors.white10,
              ),
              CampoDeTextoFormularioCustomizado(
                rotulo: "Usuário",
                required: true,
                controlador: usuarioController,
              ),
              Divider(
                height: 20.0,
                color: Colors.white10,
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
                rotulo: "Senha",
                required: true,
                controlador: senhaController,
                obscureText: true,
                tipoDoInput: TextInputType.visiblePassword,
                linhasMax: 1,
              ),
              Divider(
                height: 20.0,
                color: Colors.white10,
              ),
              CampoDeTextoFormularioCustomizado(
                rotulo: "Confirmar senha",
                required: true,

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
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Modelo",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  // Expanded(
                  //   child: botaoSelecaoModelo(),
                  // ),
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
                  /*funcao para confirmar os dados com firebase*/
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
