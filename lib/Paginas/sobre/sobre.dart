import 'package:flutter/material.dart';
import 'package:mymoto/Paginas/sobre/licenca.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sobre"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: const Text("Licenças"),
            onTap: () => Navigator.push(context, 
            MaterialPageRoute(builder: (context) => Licenca())),
          ),
          ListTile(
            title: const Text("Desenvolvimento"),
            subtitle: const Text("https://github.com/N0TN4/MyMoto"),
            onTap: (){
              
            },
          ),
          ListTile(
            title: const Text("Versão"),
            subtitle: const Text("v 2.0.0"),
          ),
        ],
      ),
    );
  }
}
