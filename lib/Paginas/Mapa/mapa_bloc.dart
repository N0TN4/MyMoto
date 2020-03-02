import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

class MapaBloc {
  static Position userLocation;
  static Geolocator geolocator = Geolocator();

  final _cepDaBusca = BehaviorSubject<String>();
  final _posicao = BehaviorSubject<Position>();
  final _posicaoDaBusca = BehaviorSubject<Position>();

  Stream<String> get cepDaBusca => _cepDaBusca.stream;
  Stream<Position> get posicao => _posicao.stream;
  Stream<Position> get posicaoDaBusca => _posicaoDaBusca.stream;

  Function(String) get changeCepDaBusca => _cepDaBusca.sink.add;
  Function(Position) get changePosicao => _posicao.sink.add;
  Function(Position) get changePosicaoDaBusca => _posicaoDaBusca.sink.add;

  void dispose() {
    _cepDaBusca.close();
    _posicao.close();
    _posicaoDaBusca.close();
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
    }
    else{
      print("[BLOC]: Endereço inválido");
    }
  }
}
