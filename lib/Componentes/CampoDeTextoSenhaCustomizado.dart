import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CampoDeTextoSenhaCustomizado extends StatefulWidget {
  final Key key;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final String labelText;
  final String suffixText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool enabled;
  final bool required;
  final FocusNode focusNode;
  final Function onFieldSubmitted;
  final int maxLines;
  final Function validator;
  final bool ativo;

  CampoDeTextoSenhaCustomizado(
      {this.key,
      this.prefixIcon,
      this.suffixIcon,
      this.hintText,
      this.labelText,
      this.suffixText,
      this.controller,
      this.textInputAction,
      this.textInputType,
      this.enabled,
      this.focusNode,
      this.required,
      this.onFieldSubmitted,
      this.maxLines,
      this.ativo,
      this.validator});

  @override
  _CampoDeTextoSenhaCustomizadoState createState() {
    return new _CampoDeTextoSenhaCustomizadoState();
  }
}

class _CampoDeTextoSenhaCustomizadoState
    extends State<CampoDeTextoSenhaCustomizado> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: TextFormField(
        obscureText: obscureText,
        maxLines: widget.maxLines,
        enabled: widget.ativo,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        controller: widget.controller,
        validator: (value) {
          if (value == null || value == "") {
            return 'Obrigatório';
          }
          if (value.length < 3) {
            return 'A senha precisa ter no minímo 6 caracteres.';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            labelStyle: TextStyle(height: 0.0, color: theme.primaryColor),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            suffixIcon: IconButton(
              icon: Icon(obscureText
                  ? FontAwesomeIcons.eye
                  : FontAwesomeIcons.eyeSlash),
              onPressed: () {
                setState(() => obscureText = !obscureText);
              },
            ),
            suffixText: widget.suffixText,
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintText,
            labelText: widget.labelText
            // labelText: labelText
            ),
      ),
    );
  }
}