import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TelaOficina extends StatefulWidget {
  @override
  _TelaOficinaState createState() => _TelaOficinaState();
}

class _TelaOficinaState extends State<TelaOficina> {
  @override
  Widget build(BuildContext context) {
    final _percentualIndicador = LinearPercentIndicator(
      width: MediaQuery.of(context).size.width - 80,
      animation: true,
      lineHeight: 20.0,
      animationDuration: 2500,
      percent: 1.0,
      center: Text("100%", style: TextStyle(fontWeight: FontWeight.bold)),
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: Colors.green,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Oficina",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: const EdgeInsets.only(
            top: 44.0, left: 22.0, right: 22.0, bottom: 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Funcionamento acelerador"),
              _percentualIndicador,
              Text("Filtro de ar"),
              _percentualIndicador,
              Text("Sinalização"),
              _percentualIndicador,
              Text("Cabo de freio"),
              _percentualIndicador,
              Text("Cabo de embreagem"),
              _percentualIndicador,
              Text("Tambor freio")
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: Container(
                height: 60,
                child: (Icon(
                  Icons.trip_origin,
                  color: Colors.pink,
                  size: 24.0,
                  semanticLabel: 'Prevenção',
                ))),
          ),
          Expanded(
            child: Container(
                height: 60,
                child: (Icon(
                  Icons.trip_origin,
                  color: Colors.pink,
                  size: 24.0,
                  semanticLabel: 'Manutenção',
                ))),
          ),
          Expanded(
            child: Container(
                height: 60,
                child: (Icon(
                  Icons.trip_origin,
                  color: Colors.pink,
                  size: 24.0,
                  semanticLabel: 'Correção',
                ))),
          ),
        ],
      ),
    );
  }
}
