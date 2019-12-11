import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:mymoto/Componentes/campo_de_texto_formulario_customizado.dart';

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Container(
        // conflito prefix 0
        // verificar em Componentes -> CampoCampoDeTextoFormularioCustomizado
        // ou ctrl + click botão esquerdo para ir direto pra classe criada
        // seguir mesmo padrão de widget stateless para botões
        
        child: CampoDeTextoFormularioCustomizado(
          rotulo: "Hello World",
          required: true,
          tipoDoInput: prefix0.TextInputType.number,
        )
      ),
    );
  }
}