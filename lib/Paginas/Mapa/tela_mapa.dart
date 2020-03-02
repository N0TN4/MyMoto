import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mymoto/Paginas/Mapa/mapa_bloc.dart';

class PageMapa extends StatefulWidget {
  @override
  _PageMapaState createState() => _PageMapaState();
}

class _PageMapaState extends State<PageMapa> {
  MapaBloc _bloc = new MapaBloc();
  //MaskedTextController cepController = MaskedTextController(mask: "00000-000");
  GoogleMapController mapController;
  //var CEP = new via_cep();
  final _cepKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _bloc.getPosicaoInicial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
        //iconTheme: IconThemeData(color: ColorsApp.azulEscuro),
        centerTitle: true,
        elevation: 0,
        //automaticallyImplyLeading: false,
        //backgroundColor: ColorsApp.azulEscuro,
        actions: <Widget>[
        ]
      ),
      body: Container(
        child: StreamBuilder(
            stream: _bloc.posicao,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              } else {
                return Stack(
                  children: <Widget>[
                    GoogleMap(
                      onMapCreated: (GoogleMapController controller) async {
                        mapController = controller;
                      },
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                            snapshot.data.latitude,
                            snapshot.data.longitude,
                          ),
                          zoom: 17),
                    ),
                    // adicionar pesquisa neste container
                    // Padding(
                    //   padding: const EdgeInsets.all(20.0),
                    //   child: Container(
                    //     height: 100,
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius:
                    //           new BorderRadius.all(Radius.circular(10)),
                    //     ),
                    //     child: Form(
                    //       key: _cepKey,
                    //       child: Row(
                    //         children: <Widget>[
                    //           //PESQUISA!
                    //           // Expanded(
                    //           //   flex: 7,
                    //           //   child: Padding(
                    //           //     padding: const EdgeInsets.all(15.0),
                    //           //     child: Caixa(
                    //           //       textInputType: TextInputType.number,
                    //           //       controller: cepController,
                    //           //       required: true,
                    //           //       bloc: _bloc
                    //           //           .changeCepDaBusca(cepController.text),
                    //           //     ),
                    //           //   ),
                    //           // ),
                    //         //   Expanded(
                    //         //     flex: 2,
                    //         //     child: IconButton(
                    //         //         icon: Container(
                    //         //             decoration: BoxDecoration(
                    //         //               color: Colors.red,
                    //         //               borderRadius: new BorderRadius.all(
                    //         //                   Radius.circular(10)),
                    //         //             ),
                    //         //             child: Padding(
                    //         //               padding: const EdgeInsets.all(4.0),
                    //         //               child: Icon(Icons.search),
                    //         //             )),
                    //         //         onPressed: () async {
                    //         //           // Verifica se os dados não são nulos
                    //         //           if (_cepKey.currentState.validate()) {
                    //         //             var result = await CEP.searchCEP(
                    //         //                 cepController.text, 'json', '');

                    //         //             if (CEP.getResponse() == 200) {
                    //         //               // validacao de cpf
                    //         //               // se o cpf buscado (200) tiver a cidade null ou bairro null é porque o usuario
                    //         //               // digitou um cpf inválido
                    //         //               if (CEP.getLogradouro() != null ||
                    //         //                   CEP.getBairro() != null) {
                    //         //                 await _bloc
                    //         //                     .getEndereco(cepController.text)
                    //         //                     .then((posicaoDaBusca) {
                    //         //                   if (posicaoDaBusca != null ||
                    //         //                       posicaoDaBusca != "") {
                    //         //                     mapController.animateCamera(
                    //         //                       CameraUpdate
                    //         //                           .newCameraPosition(
                    //         //                         CameraPosition(
                    //         //                             target: LatLng(
                    //         //                                 posicaoDaBusca
                    //         //                                     .latitude,
                    //         //                                 posicaoDaBusca
                    //         //                                     .longitude),
                    //         //                             zoom: 17),
                    //         //                       ),
                    //         //                     );
                    //         //                   }
                    //         //                 });
                    //         //               }
                    //         //             } else {
                    //         //               print('Código de Retorno: ' +
                    //         //                   CEP.getResponse().toString());
                    //         //               print('Erro: ' + CEP.getBody());
                    //         //             }
                    //         //           }
                    //         //         }),
                    //         //   ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                );
              }
            }),
      ),
      // floatingActionButton: StreamBuilder<Position>(
      //   stream: _bloc.posicao,
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return Container();
      //     } else {
      //       return FloatingActionButton(
      //         //backgroundColor: ColorsApp.roxoBase,

      //         // adicionar botoes de pesquisa aqui
      //         onPressed: () {
      //           // mapController.animateCamera(
      //           //   CameraUpdate.newCameraPosition(
      //           //     CameraPosition(
      //           //         target: LatLng(
      //           //             snapshot.data.latitude, snapshot.data.longitude),
      //           //         zoom: 17),
      //           //   ),
      //           // );
      //         },
      //         child: Icon(Icons.gps_fixed),
      //       );
      //     }
      //   },
      // ),
    );
  }
}
