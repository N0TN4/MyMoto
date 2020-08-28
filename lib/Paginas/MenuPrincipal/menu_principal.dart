import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoto/Componentes/cores_app.dart';
import 'package:mymoto/Componentes/menu_lateral.dart';
import 'package:mymoto/Ferramentas/estilos_de_texto.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';
//import 'package:mymoto/Paginas/EditarPerfil/editar_perfil.dart';
//import 'package:mymoto/Paginas/EditarOdometro/editar_odometro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mymoto/Paginas/Oficina/tela_oficina.dart';

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  List _imagemLista = [
    'assets/manutencao01.jpg',
    'assets/manutencao02.jpg',
    'assets/manutencao03.jpg',
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
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("My Moto",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      )),
                  background: Image.network(
                    "https://media.istockphoto.com/photos/motorcycle-driving-on-the-asphalt-road-in-rural-landscape-at-sunset-picture-id1140461954?k=6&m=1140461954&s=612x612&w=0&h=GhpYh3hNXKSDcFMdW7qY3sZLdzpk9tQrghSKxf0BmHw=",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: SingleChildScrollView(
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
                padding: const EdgeInsets.only(top: 30.0),
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
                              margin: EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.redAccent,
                              ),
                              child: Image.asset(
                                imagemUrl,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    // imagem
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 8),
                      child: Container(
                        child: Text(
                          "Minha moto ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
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
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
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
                  ], // Coluna do body
                ),
              ),
            ],
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
