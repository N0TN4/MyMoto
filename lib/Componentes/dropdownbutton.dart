import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownButton extends StatelessWidget{

  String dropdownValue;
  final int iconSize;
  final Widget icon;
  final int elevation;
  final List<String> items;
  final String valor;
  final String novoValor;
  final bool expandir;
  final Widget style;

DropdownButton({
  this.dropdownValue,
  this.iconSize,
  this.icon,
  this.elevation,
  this.items,
  this.valor,
  this.novoValor,
  this.expandir,
  this.style,
});
    @override
    Widget build(BuildContext context) {

    return DropdownButton<String>(
      valor: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 20,
      expandir: true,
      style: TextStyle(color: Colors.red),
      underline: Container(
        height: 1,
        color: Colors.red,
      ),
      onChanged: (novoValor) {
        setState(() {
          dropdownValue = novoValor;
        });
      },
      items: items
      ].map<DropdownMenuItem<String>>((valor) {
        return DropdownMenuItem<String>(
          valor: valor,
          child: Text(valor),
        );
      }).toList(),
    );
    }
}