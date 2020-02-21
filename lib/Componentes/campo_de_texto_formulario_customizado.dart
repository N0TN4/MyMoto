import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CampoDeTextoFormularioCustomizado extends StatelessWidget {
  final Key key;
  final Widget preIcone;
  final Widget posIcone;
  final String rotulo;
  final TextEditingController controlador;
  final TextInputType tipoDoInput;
  final bool ativo;
  final FocusNode focusNode;
  final Function campoSubmetido;
  final int linhasMax;
  final bool required;
  final TextCapitalization capitalizacao;
  final String valorInicial;
  final String valorController;
  final dynamic bloc;
  final String mask;
  final TextEditingController maskedTextFieldController;
  final bool obscureText;
  final InputDecoration decoration;

  CampoDeTextoFormularioCustomizado(
      {this.key,
      this.preIcone,
      this.posIcone,
      this.rotulo,
      this.controlador,
      this.tipoDoInput,
      this.ativo,
      this.focusNode,
      this.campoSubmetido,
      this.linhasMax,
      this.required,
      this.capitalizacao,
      this.valorInicial,
      this.valorController,
      this.bloc,
      this.mask,
      this.maskedTextFieldController,
      this.obscureText = false,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    var tema = Theme.of(context);

    return TextFormField(
      maxLines: linhasMax,
      focusNode: focusNode,
      textCapitalization:
          capitalizacao == null ? TextCapitalization.none : capitalizacao,
      onFieldSubmitted: campoSubmetido,
      keyboardType: tipoDoInput,
      controller: controlador,
      obscureText: obscureText,
      validator: required == true
          ? (value) => value.isEmpty ? 'Obrigatório' : null
          : null,
      decoration: decoration == null
          ? InputDecoration(
              labelStyle: TextStyle(height: 0.0, color: tema.primaryColor),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              suffixIcon: posIcone,
              prefixIcon: preIcone,
              hintText: rotulo)
          : decoration,
    );
  }
}
