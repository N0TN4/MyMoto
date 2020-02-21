import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoto/Componentes/menu_lateral.dart';
import 'package:mymoto/Ferramentas/estilos_de_texto.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';
//import 'package:mymoto/Paginas/EditarPerfil/editar_perfil.dart';
//import 'package:mymoto/Paginas/EditarOdometro/editar_odometro.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  List imagemLista = [
    'https://st.depositphotos.com/1428083/1907/i/950/depositphotos_19076717-stock-photo-motorcycle.jpg',
    'https://st2.depositphotos.com/2853475/7322/i/950/depositphotos_73223241-stock-photo-two-motorcycles-on-the-hills.jpg',
    'https://st2.depositphotos.com/2853475/7010/i/450/depositphotos_70102441-stock-photo-two-motorbikes-driving-in-the.jpg',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuLateral(),
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
              Container(
                padding: const EdgeInsets.only(top: 44.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CarouselSlider(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      autoPlayAnimationDuration: Duration(milliseconds: 977),
                      pauseAutoPlayOnTouch: Duration(seconds: 10),
                      height: 220.0,
                      items: imagemLista.map((imagemUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.redAccent,
                              ),
                              child: Image.network(
                                imagemUrl,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    // imagem
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListTile(
                        leading: Container(
                          child: Image.network(
                              "https://www.cabralmotor.com.br/wp-content/uploads/Honda-cg-160-fan-cinza-cabral-motor.jpg"),
                        ),
                        title:
                            Text("CG 160", style: EstilosDeTexto.estiloLista),
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
                      child: Text("Botao".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ], // Coluna do body
                ),
              ),
            ],
          ),
        ));
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
