import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';
import 'package:mymoto/Paginas/Oficina/navegacao_oficina.dart';
import 'package:mymoto/Paginas/Oficina/tela_oficina_bloc.dart';
import 'package:mymoto/Paginas/TrocarMoto/trocar_moto.dart';
import 'package:mymoto/notificacao/notificao_manutencao.dart';

class TelaOficina extends StatefulWidget {
  @override
  _TelaOficinaState createState() => _TelaOficinaState();
}

class _TelaOficinaState extends State<TelaOficina> {
  int indiceDaPagina = 0; // controla a bottom navigation
  // inicializa com prevenção

  TelaOficinaBloc _blocOficina = new TelaOficinaBloc();

  @override
  void initState() {
    print("${UsuarioLogado.usuario.id}");
    _blocOficina.getUsuarioMoto();
    NotificaoManutencao notificao = NotificaoManutencao();
    notificao.exibirNotificacao();
    print("HelloWorld");
    print("Time = ${DateTime.now().add(new Duration(seconds: 10))}");
    super.initState();

    // é necessário isso no meu celular, pois os botões nativos do android fica em cima da BottomNavigation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: null,
        title: Text(
          "Oficina",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: buildPageView(),
      ),
      bottomSheet: BottomNavigationBar(
        backgroundColor: Colors.red, // verificar cores chrome white
        currentIndex: indiceDaPagina, // aqui atribui a variavel criada
        selectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        selectedItemColor: Colors.white,
        elevation: 20,
        onTap: (index) {
          setState(() {
            bottomTapped(index);
          });
        },

        items: [
          BottomNavigationBarItem(
            title: Text("Manutenção"),
            icon: IconButton(
              icon: Icon(
                Icons.settings,
                //color: Colors.pink, // a cor é setada quando o usuário tocar
                size: 24.0,
                semanticLabel: 'Manutenção',
              ),
              // onPressed: () {
              //   // quando tocar
              //   // vai setar o indice da pagina como 0

              //   setState(() {
              //     indiceDaPagina = 0;
              //   }
              //   );
              //   // todo: PageView
              //   // quando tocar em prevenção ele vai enviar o indice para a pageView
              //   // a page view vai verificar se é 0, e vai mostrar os valores da pagina atual
              // }
            ),
          ),
          BottomNavigationBarItem(
            title: Text("My Moto"),
            icon: IconButton(
              icon: Icon(
                Icons.motorcycle,
                //color: Colors.blue,
                size: 24.0,
                semanticLabel: 'My Moto',
              ),
              // onPressed: () {
              //   // quando tocar
              //   // vai setar o indice da pagina como 1
              //   setState(() {
              //     indiceDaPagina = 1;
              //   });
              // }
            ),
          ),
        ],
      ),
    );
  }

  void bottomTapped(int index) {
    setState(() {
      indiceDaPagina = index;
      pageController.jumpToPage(index);
    });
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        setState(() {
          indiceDaPagina = index;
        });
      },
      children: <Widget>[
        NavegacaoOficina(),
        TrocarMoto(),
      ],
    );
  }
}
