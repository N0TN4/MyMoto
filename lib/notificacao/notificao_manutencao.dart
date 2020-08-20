import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificaoManutencao {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var configuracaoDeInicializacaoAndroid;
  var configuracaoDeInicializacaoIOS;
  var configuracoesDeInicializacao;
  void exibirNotificacao() async {
    //await _notificacao();
    // retirado apenas para nao da error
  }

  static BuildContext context;

  Future<void> notificar({@required int dias, String peca}) async {
    print("enviando notificação para $dias dias");

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_ID', 'channel name', 'channel description',
        importance: Importance.Max,
        color: Colors.red,
        icon: 'app_icon',
        priority: Priority.High,
        sound: RawResourceAndroidNotificationSound('notificacao_moto_ligar'),
        playSound: true,
        ticker: 'test ticker');

    var iOSChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSChannelSpecifics);

    // await flutterLocalNotificationsPlugin.show(0, 'Hello World!!!',
    //     'Hello World', platformChannelSpecifics,
    //     payload: 'test oayload');

    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Atenção!!!',
        '$peca está em 25%',
        DateTime.now().add(new Duration(days: dias)),
        platformChannelSpecifics,
        payload: 'test oayload');
  }

  initializedNotification() async {
    // configuracaoDeInicializacaoAndroid =
    //     new AndroidInitializationSettings('app_icon');
    // configuracaoDeInicializacaoIOS = new IOSInitializationSettings(
    //     onDidReceiveLocalNotification: notificacaoLocal);
    // configuracoesDeInicializacao = new InitializationSettings(
    //     configuracaoDeInicializacaoAndroid, configuracaoDeInicializacaoIOS);

    configuracoesDeInicializacao = InitializationSettings(
        configuracaoDeInicializacaoAndroid, configuracaoDeInicializacaoIOS);
    await flutterLocalNotificationsPlugin
        .initialize(configuracoesDeInicializacao);
  }

  // Future notificacaoLocal(
  //     int id, String titulo, String body, String payLoad) async {
  //   await showDialog(
  //       context: context,
  //       builder: (BuildContext context) => CupertinoAlertDialog(
  //             title: Text(titulo),
  //             content: Text(body),
  //             actions: <Widget>[
  //               CupertinoDialogAction(
  //                 isDefaultAction: true,
  //                 child: Text('OK'),
  //                 onPressed: () {

  //                 },
  //               )
  //             ],
  //           ));
  // }
}
