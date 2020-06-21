import 'package:mymoto/Paginas/EnviarFeedback/feedback_services.dart';
import 'package:mymoto/Paginas/EnviarFeedback/feedback_model.dart';
import 'package:rxdart/rxdart.dart';

import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';

class FeedbackBloc {
  final _mensagemDoUsuario = BehaviorSubject<String>();
  final _informacoesDoAparelho = BehaviorSubject<String>();

  Function(String) get setInformacoesDoAparelho => _informacoesDoAparelho.sink.add;
  Function(String) get setMensagemDoUsuario => _mensagemDoUsuario.sink.add;
  
  FeedbackServices _services = new FeedbackServices();
  
  Future<String> initPlatformState() async {
    Map<String, dynamic> deviceData;
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    String aparelhoInfo = deviceData['model'] +", "+ deviceData['androidId'] +", "+ deviceData['version.securityPatch'];
      print(aparelhoInfo.toString().toUpperCase());
      setInformacoesDoAparelho(aparelhoInfo);
    return aparelhoInfo;
  }


  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'androidId': build.androidId,
      'id': build.id,
      'model': build.model,
      'manufacturer': build.manufacturer,
      'display': build.display,
      'version.baseOS': build.version.baseOS,
      //##########################//

      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.incremental': build.version.incremental,

      'device': build.device,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
  
  Future<bool> enviarMensagem() async {
    FeedBackModel feedback = new FeedBackModel();
    feedback.mensagemDoUsuario = _mensagemDoUsuario.value;
    feedback.informacoesDoAparelho = _informacoesDoAparelho.value;
    feedback.dataDeEnvio = DateTime.now();
    

    print("${feedback.mensagemDoUsuario}");
    return await _services.enviarMensagem(feedback).then((response) {
      print("POST - $response");
      if (response != null) {
        
        return true;
      }
      else{
        return false;
      }
    });

  }

  void dispose() {
    _mensagemDoUsuario.close();
    _informacoesDoAparelho.close();
  }
}