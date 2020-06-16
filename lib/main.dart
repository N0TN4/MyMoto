import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/Paginas/LoginSocial/login_social.dart';
import 'package:mymoto/Paginas/LoginSocial/login_social_bloc.dart';
import 'package:mymoto/Paginas/MenuPrincipal/menu_principal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'MyMoto',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // my home page trocar para splash
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
        seconds: 4,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.white, Colors.white70],
        ),
        loadingText: Text("Pilote com cuidado!"),

        //alterar  para rota que irá editar
        navigateAfterSeconds: PosLogin(),
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

class PosLogin extends StatefulWidget {
  @override
  _PosLoginState createState() => _PosLoginState();
}

class _PosLoginState extends State<PosLogin> {
  bool isLoggedIn = false;
  BlocLoginSocial _bloc = new BlocLoginSocial();

  @override
  void initState() {
    autoLogIn();
    super.initState();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String email = prefs.getString('email');
    final String senha = prefs.getString('senha');
    print(email);
    print(senha);
    Usuario usuario = new Usuario();
    usuario.email = email;
    usuario.senha = senha;

    // a avalidação se for null está dentro do siinpadrao movendo o u u´sario para ocadasrtro
    if (usuario.email == null || usuario.senha == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginSocial()));
    } else {
      await _bloc.logar(usuario).then((logado) {
        //msg(logado);
        
        if (logado) {
          // Navigator.of(context).pop();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MenuPrincipal()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginSocial()));
        }
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
