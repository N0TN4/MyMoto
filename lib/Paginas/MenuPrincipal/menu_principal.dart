import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoto/Componentes/cores_app.dart';
import 'package:mymoto/Componentes/menu_lateral.dart';
import 'package:mymoto/Ferramentas/estilos_de_texto.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';
//import 'package:mymoto/Paginas/EditarPerfil/editar_perfil.dart';
//import 'package:mymoto/Paginas/EditarOdometro/editar_odometro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mymoto/Paginas/Mapa/tela_mapa.dart';
import 'package:mymoto/Paginas/Oficina/tela_oficina.dart';

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  List _imagemLista = [
    'assets/white.png',
    'assets/white.png',
    'assets/white.png',
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("My Moto",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      )),
                  background: Image.asset(
                    "assets/white.png",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0),
              Colors.black.withOpacity(0.16),
            ],
          )),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //tela de boas vindas
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    child: Text(
                      "Seja bem vindo ao MyMoto \n${UsuarioLogado.usuario.nome}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CarouselSlider(
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 6),
                        autoPlayAnimationDuration: Duration(seconds: 4),
                        pauseAutoPlayOnTouch: Duration(seconds: 6),
                        height: 220.0,
                        items: _imagemLista.map((imagemUrl) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                      colors: [Colors.black, Colors.red]),
                                ),
                                child: Image.asset(
                                  imagemUrl,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          elevation: 5,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text(
                                    "${UsuarioLogado.usuario.moto.nome ?? ""}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      "${UsuarioLogado.usuario.moto.mediaDiariaKm ?? ""} km/dia\n" +
                                          "Ultima modificação : ${UsuarioLogado.usuario.moto.dataDeAlteracao.day}/${UsuarioLogado.usuario.moto.dataDeAlteracao.month}/${UsuarioLogado.usuario.moto.dataDeAlteracao.year}"),
                                  leading: Icon(
                                    Icons.motorcycle,
                                    size: 32,
                                    color: CoresApp.secundaria,
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: CoresApp.secundaria,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TelaOficina()),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                height: 40,
                                width: double.infinity,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.red)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TelaOficina()),
                                    );
                                  },
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  child: Text("Ir para a oficina".toUpperCase(),
                                      style: TextStyle(fontSize: 14)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          elevation: 5,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text(
                                    "Buscar oficinas e postos de gasolina proximos",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      "${UsuarioLogado.usuario.moto.mediaDiariaKm ?? ""} km/dia\n" +
                                          "Ultima modificação : ${UsuarioLogado.usuario.moto.dataDeAlteracao.day}/${UsuarioLogado.usuario.moto.dataDeAlteracao.month}/${UsuarioLogado.usuario.moto.dataDeAlteracao.year}"),
                                  leading: Icon(
                                    Icons.local_gas_station,
                                    size: 32,
                                    color: Colors.green,
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.green,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PageMapa()),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                height: 40,
                                width: double.infinity,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                    color: Colors.green,
                                  )),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PageMapa()),
                                    );
                                  },
                                  color: Colors.green,
                                  textColor: Colors.white,
                                  child: Text("Ir para o mapa".toUpperCase(),
                                      style: TextStyle(fontSize: 14)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ], // Coluna do body
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
}
