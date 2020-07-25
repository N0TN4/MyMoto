import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mymoto/Componentes/cores_app.dart';
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
          actions: <Widget>[]),
      body: Container(
        child: StreamBuilder(
            stream: _bloc.posicao,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              } else {
                return Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    GoogleMap(
                      onMapCreated: (GoogleMapController controller) async {
                        mapController = controller;
                      },
                      markers: _bloc.pegarMarker(),
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                            snapshot.data.latitude,
                            snapshot.data.longitude,
                          ),
                          zoom: 17),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white,
                            Colors.white.withOpacity(0.1),
                          ],
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.motorcycle,
                                      color: CoresApp.secundaria),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Center(
                                          child:
                                              new CircularProgressIndicator()),
                                    );

                                    Timer(Duration(seconds: 2), () {
                                      return _bloc
                                          .getPontosOficina(
                                              snapshot.data.latitude,
                                              snapshot.data.longitude)
                                          .then((response) {
                                        setState(() {});
                                        return Navigator.of(context).pop();
                                      });
                                    });
                                    //
                                  },
                                ),
                                Text("Oficinas"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.local_gas_station,
                                      color: Colors.green),
                                  onPressed: () {
                                    //     setState(() {
                                    //       _bloc.getPontosDeGasolina(
                                    //           snapshot.data.latitude,
                                    //           snapshot.data.longitude);
                                    //       setState(() {});
                                    //     });
                                    //   },
                                    // ),
                                    showDialog(
                                      context: context,
                                      builder: (context) => Center(
                                          child:
                                              new CircularProgressIndicator()),
                                    );

                                    Timer(Duration(seconds: 2), () {
                                      return _bloc
                                          .getPontosDeGasolina(
                                              snapshot.data.latitude,
                                              snapshot.data.longitude)
                                          .then((response) {
                                        setState(() {});
                                        return Navigator.of(context).pop();
                                      });
                                    });
                                    //
                                  },
                                ),
                                Text("Postos de gasolina"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
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
