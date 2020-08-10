import 'package:flutter/cupertino.dart';
import 'package:mymoto/Componentes/searchbox.dart';

class TrocarMoto extends StatefulWidget {
  @override
  _TrocarMotoState createState() => _TrocarMotoState();
}

class _TrocarMotoState extends State<TrocarMoto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[
            Search(),
            // ListView(
            //   children: <Widget>[Text("asd")],
            // ),
          ],
        ),
      ),
    );
  }
}
