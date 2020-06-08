import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mymoto/Paginas/Mapa/mapa_services.dart';
import 'package:rxdart/rxdart.dart';

class MapaBloc {
  static Position userLocation;
  static Geolocator geolocator = Geolocator();
  final _markers = BehaviorSubject<Set<Marker>>();
  final _cepDaBusca = BehaviorSubject<String>();
  final _posicao = BehaviorSubject<Position>();
  final _posicaoDaBusca = BehaviorSubject<Position>();

  Stream<Set<Marker>> get markers => _markers.stream;
  Stream<String> get cepDaBusca => _cepDaBusca.stream;
  Stream<Position> get posicao => _posicao.stream;
  Stream<Position> get posicaoDaBusca => _posicaoDaBusca.stream;
  Function(Set<Marker>) get changeMarkers => _markers.sink.add;
  Function(String) get changeCepDaBusca => _cepDaBusca.sink.add;
  Function(Position) get changePosicao => _posicao.sink.add;
  Function(Position) get changePosicaoDaBusca => _posicaoDaBusca.sink.add;

  MapaServices _servicesMapa = new MapaServices();
  void dispose() {
    _cepDaBusca.close();
    _posicao.close();
    _posicaoDaBusca.close();
    _markers.close();
  }

  getPosicaoInicial() async {
    return await _getLocation().then((position) {
      userLocation = position;
      print(position);
      changePosicao(position);
    });
  }

  Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  getEndereco(String enderecoCompleto) async {
    //OBS COLOCAR RUA -> NÚMERO -> CIDADE DO ENDEREÇO DO RESTAURANTE QUE VEIO DA API, Ex:. Rua Buenos Aires 277, Umuarama
    if (enderecoCompleto != null || enderecoCompleto != "") {
      List<Placemark> placemark =
          await Geolocator().placemarkFromAddress(enderecoCompleto);
      Placemark lugar = placemark[0];
      print(
          "${lugar.thoroughfare}, ${lugar.postalCode}, ${lugar.administrativeArea}, ${lugar.subLocality}, ${lugar.isoCountryCode}, ${lugar.country}, ${lugar.position.latitude} ${lugar.position.longitude} ");

      changePosicaoDaBusca(lugar.position);
      return lugar.position;
    } else {
      print("[BLOC]: Endereço inválido");
    }
  }

  getPontosDeGasolina(lat, lon) async {
    Set<Marker> marker = {};
    await _servicesMapa.getPostosDeGasolinaProximos(lat, lon).then((response) {
      if (response != null) {
        print("resposta ${response}");
        for (var i = 0; i < response.length; i++) {
          print("lat long ${response[i].latitude} ${response[i].longitude}");
          marker.add(
            Marker(
              markerId:
                  MarkerId("${response[i].latitude} ${response[i].longitude}"),
              infoWindow: InfoWindow(
                title: response[i].nome,
                //   snippet:s
                //       '${response[i].pessoasPrevistas.toStringAsFixed(0)} pessoas neste local',
                // ),
                snippet: '${response[i].nome}',
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
              position: LatLng(response[i].latitude, response[i].longitude),
            ),
          );
        }
      }
    });
    return changeMarkers(marker);
  }

  getPontosOficina(lat, lon) async {
    Set<Marker> marker = {};
    await _servicesMapa.getPontosOficina(lat, lon).then((response) {
      if (response != null) {
        print("resposta ${response}");
        for (var i = 0; i < response.length; i++) {
          print("lat long ${response[i].latitude} ${response[i].longitude}");
          marker.add(
            Marker(
              markerId:
                  MarkerId("${response[i].latitude} ${response[i].longitude}"),
              infoWindow: InfoWindow(
                title: response[i].nome,
                //   snippet:s
                //       '${response[i].pessoasPrevistas.toStringAsFixed(0)} pessoas neste local',
                // ),
                snippet: '${response[i].nome}',
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
              position: LatLng(response[i].latitude, response[i].longitude),
            ),
          );
        }
        changeMarkers(marker);
      }
    });
    return changeMarkers(marker);
  }

  pegarMarker() {
    return _markers.value;
  }
}
