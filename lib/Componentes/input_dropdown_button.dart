import 'package:flutter/material.dart';
class InputDropDownButton extends StatefulWidget {
  final Function onChanged;
  final String text;

  const InputDropDownButton({Key key, this.onChanged, this.text})
      : super(key: key);

  @override
  _InputDropDownButtonState createState() => _InputDropDownButtonState();
}

class _InputDropDownButtonState extends State<InputDropDownButton> {
  String selected;
  List<String> options = [
    'Segmento 1',
    'Segmento 2',
    'Segmento 3',
    'Segmento 4',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: DropdownButtonFormField(
            onChanged: (value) {
              setState(() => selected = value);
              // widget.onChanged(value);
            },
            value: selected,
            items: options
                .map((option) => DropdownMenuItem(
                      value: option,
                      child: Text('$option',
                          style: TextStyle(
                              fontSize: 11.0, color: Colors.red)),
                    ))
                .toList()),
      ),
    );
  }
}
