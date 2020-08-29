import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoto/Componentes/cores_app.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';
import 'package:mymoto/Paginas/EnviarFeedback/tela_ajuda.dart';
import 'package:mymoto/Paginas/EditarOdometro/editar_odometro.dart';
import 'package:mymoto/Paginas/EditarPerfil/editar_perfil.dart';
import 'package:mymoto/Paginas/LoginSocial/login_social.dart';
import 'package:mymoto/Paginas/Mapa/tela_mapa.dart';

import 'package:mymoto/Paginas/Oficina/tela_oficina.dart';
import 'package:mymoto/Paginas/sobre/sobre.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    criarCelulaNoMenu(String label, IconData icone, {pagina}) {
      if (label == "Sair") {
        logout();
      }
      return ListTile(
        leading: Icon(icone),
        title: Text(label),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => pagina));
        },
      );
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("${UsuarioLogado.usuario.nome ?? ""}"),
            accountEmail: Text("${UsuarioLogado.usuario.email ?? ""}"),
            onDetailsPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditarPerfil()));
            },
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Text(
                "${UsuarioLogado.usuario.nome[0].toUpperCase() ?? ""}",
                style: TextStyle(
                  fontSize: 36,
                  color: CoresApp.secundaria,
                ),
              ),
            ),
          ),
          criarCelulaNoMenu("Minha moto", Icons.motorcycle,
              pagina: EditarOdometro()),
          criarCelulaNoMenu("Sobre", Icons.help, pagina: Sobre()),
          criarCelulaNoMenu("Oficina", Icons.settings, pagina: TelaOficina()),
          criarCelulaNoMenu("Encontrar postos e oficinas", Icons.location_on, pagina: PageMapa()),
          criarCelulaNoMenu("Enviar feedback ou reportar", Icons.send, pagina: TelaAjuda()),
          criarCelulaNoMenu("Sair", Icons.exit_to_app, pagina: LoginSocial()),
        ],
      ),
    );
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', null);
    prefs.setString('senha', null);
  }
}
