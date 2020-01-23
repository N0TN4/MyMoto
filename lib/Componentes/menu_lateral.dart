import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';
import 'package:mymoto/Paginas/EditarOdometro/editar_odometro.dart';
import 'package:mymoto/Paginas/EditarPerfil/editar_perfil.dart';
import 'package:mymoto/Paginas/Oficina/oficina.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    criarCelulaNoMenu(String label, IconData icone, {pagina}) {
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
            accountName: Text("${UsuarioLogado.usuario.nome}"),
            accountEmail: Text("${UsuarioLogado.usuario.email}"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: UsuarioLogado.usuario.linkFoto == null
                  ? Text("A")
                  : Image.network("${UsuarioLogado.usuario.linkFoto}"),
            ),
          ),
          criarCelulaNoMenu("MyMoto", Icons.motorcycle,
              pagina: EditarOdometro()),
          criarCelulaNoMenu("Oficina", Icons.settings, pagina: Oficina()),
          criarCelulaNoMenu("Perfil", Icons.person, pagina: EditarPerfil()),
        ],
      ),
    );
  }
}
