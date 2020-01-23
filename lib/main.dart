import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mymoto/Autenticacao/autenticacao_google.dart';
import 'package:mymoto/Paginas/Cadastro/cadastro_por_email.dart';
import 'package:mymoto/Paginas/EditarPerfil/editar_perfil.dart';
import 'package:mymoto/Paginas/LoginSocial/login_social.dart';
import 'package:mymoto/Paginas/MenuPrincipal/menu_principal.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyMoto',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
     
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  SystemChrome.setEnabledSystemUIOverlays([]);

  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 2,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.white, Colors.white70],
        ),

        loadingText: Text("Pilote com cuidado!"),

        //alterar  para rota que irá editar
        navigateAfterSeconds:  CadastroPorEmail(),
        loaderColor: Colors.red,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logo.png"),
            fit: BoxFit.none,
          ),
        ),
      ),
    ],
  );
}
