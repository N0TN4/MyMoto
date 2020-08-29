import 'package:flutter/material.dart';

class Licenca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Licença"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: const Text("Images (menu principal)"),
            subtitle: const Text("pixabay.com"),
          ),
          ListTile(
            title: const Text("Ícone notificação"),
            subtitle: const Text(""),
          ),
        ],
      ),
    );
  }
}
