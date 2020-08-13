import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

abstract class AbstractService<T> {
  static String staticAPI = 'https://mymotoapi.herokuapp.com';
  //static String staticAPI = 'http://200.124.82.242:8090';
  String api = AbstractService.staticAPI;

  AbstractService(String path) {
    this.api += path;
  }

  T fromJson(json);
  Map toJson(dynamic instance) => instance.toJson();

  Future<T> find(int id) =>
      Session.get('$api/$id').then((json) => json).then(fromJson);

  Future<List<T>> findAll() => Session.get(api).then((list) {
        List<T> m = List<T>();
        if (list.length > 0) {
          list.forEach((v) {
            m.add(fromJson(v));
          });
        }
        return m;
      });

  Future<T> create(T instance) =>
      Session.post('$api', body: toJson(instance)).then((dynamic json) {
        print(api);

        return json;
      }).then(fromJson);

  Future update(dynamic id, T instance) =>
      Session.put('$api/$id', body: toJson(instance))
          .then((dynamic json) => json)
          .then((value) {
        return value;
      });

  Future<int> remove(dynamic id) async => await Session.delete('$api/$id');
}

class Session {
  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static Future<dynamic> get(String url) =>
      http.get(url, headers: headers).then((response) {
        // print(response.body + "DSADSADASDASDASAAAAA");
        print('GET ' + url);
        return response.body;
      }).then(json.decode);

  static Future<dynamic> post(String url, {Map body}) => http
          .post(url, body: json.encode(body), headers: headers)
          .then((response) {
        print('POST ' + url);
        return response.body;
      }).then(json.decode);

  static Future<dynamic> put(String url, {Map body}) async {
    return http
        .put(url, body: json.encode(body), headers: headers)
        .then((response) {
      print('PUT ' + url);
      return response.body;
    });
  }

  static Future<dynamic> delete(String url) async => http
      .delete(url, headers: headers)
      .then((response) => response.body)
      .then(json.decode);
}
