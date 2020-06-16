import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';
import 'package:mymoto/Paginas/EnviarFeedback//ajuda.dart';
import 'package:mymoto/Paginas/EditarOdometro/editar_odometro.dart';
import 'package:mymoto/Paginas/EditarPerfil/editar_perfil.dart';
import 'package:mymoto/Paginas/LoginSocial/login_social.dart';
import 'package:mymoto/Paginas/Mapa/tela_mapa.dart';
import 'package:mymoto/Paginas/Oficina/oficina.dart';
import 'package:mymoto/Paginas/Oficina/tela_oficina.dart';
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
            accountName: Text(UsuarioLogado.usuario.id != null
                ? "${UsuarioLogado.usuario.id}\n"
                : "" + "${UsuarioLogado.usuario.nome}"),
            accountEmail: Text("${UsuarioLogado.usuario.email}"),
            onDetailsPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditarPerfil()));
            },
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              // child: UsuarioLogado.usuario.linkFoto == null
              //     ? Text("A")
              //     : Image.network("${UsuarioLogado.usuario.linkFoto}"),
            ),
          ),
          criarCelulaNoMenu("MyMoto", Icons.motorcycle,
              pagina: EditarOdometro()),
          criarCelulaNoMenu("Oficina", Icons.settings, pagina: TelaOficina()),
          criarCelulaNoMenu("Mapa", Icons.location_on, pagina: PageMapa()),
          criarCelulaNoMenu("Ajuda", Icons.help, pagina: Ajuda()),
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
