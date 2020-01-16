import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoto/Ferramentas/estilos_de_texto.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("${UsuarioLogado.usuario.nome}"),
              accountEmail: Text("${UsuarioLogado.usuario.email}"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: UsuarioLogado.usuario.linkFoto == null
                    ? Text("A")
                    : Image.network("${UsuarioLogado.usuario.linkFoto}"),
              ),
            ),
            criarCelulaNoMenu("MyMoto", Icons.motorcycle),
            criarCelulaNoMenu("Oficina", Icons.settings),
            criarCelulaNoMenu("Perfil", Icons.person),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "MyMoto",
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            //tela de boas vindas
            SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                child: Text(
                  "Bem vindo ao MyMoto ${UsuarioLogado.usuario.nome}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            // imagem
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListTile(
                leading: Container(
                  child: Image.network(
                      "https://www.cabralmotor.com.br/wp-content/uploads/Honda-cg-160-fan-cinza-cabral-motor.jpg"),
                ),
                title: Text("CG 160", style: EstilosDeTexto.estiloLista),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {},
                  //Para fazer : levar o objeto da moto, contendo os atributos de nome, urlDaFoto, e afins
                  //Ao pressionar o ícone o Usuario vai pra tela da moto que escolheu.
                ),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.red)),
              onPressed: () {},
              color: Colors.red,
              textColor: Colors.white,
              child:
                  Text("Buy now".toUpperCase(), style: TextStyle(fontSize: 14)),
            ),
          ], // Coluna do body
        ),
      ),
    );
  }

  criarCelulaNoMenu(String label, IconData icone) {
    return ListTile(
      leading: Icon(icone),
      title: Text(label),
      onTap: () {
        print("${UsuarioLogado.usuario.linkFoto}");
      },
    );
  }
}
