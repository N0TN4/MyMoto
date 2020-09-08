import 'package:flutter/material.dart';
import 'package:mymoto/Cores/cores.dart';

class CaixaDeSelecao extends StatefulWidget {
  final Function onChanged;
  final String text;
  final List<String> options;
  final String value;

  CaixaDeSelecao({Key key, this.onChanged, this.text, this.options, this.value})
      : super(key: key);

  @override
  _CaixaDeSelecao createState() => _CaixaDeSelecao();
}

class _CaixaDeSelecao extends State<CaixaDeSelecao> {
  String selected;

  @override
  void initState() {
    super.initState();
    selected = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: Border.all(color: corSecundaria, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: DropdownButtonFormField(
            isExpanded: true,
            onChanged: (value) {
              setState(() => selected = value);
              widget.onChanged(value);
            },
            value: selected,
            items: widget.options
                .map(
                  (option) => DropdownMenuItem(
                    value: option,
                    child: Text('$option',
                        style: TextStyle(fontSize: 12.0, color: corSecundaria)),
                  ),
                )
                .toList()),
      ),
    );
  }
}
