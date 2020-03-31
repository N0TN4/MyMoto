import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoto/Componentes/cores_app.dart';

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
  final String label;

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
      this.obscureText,
      this.label});

  @override
  Widget build(BuildContext context) {
    var tema = Theme.of(context);

    return TextFormField(
      enabled: ativo,
      maxLines: linhasMax,
      focusNode: focusNode,
      textCapitalization:
          capitalizacao == null ? TextCapitalization.none : capitalizacao,
      onFieldSubmitted: campoSubmetido,
      keyboardType: tipoDoInput,
      controller: controlador,
      textInputAction: TextInputAction.done,
      validator: required == true
          ? (value) => value.isEmpty ? 'Obrigatório' : null
          : null,
      decoration: InputDecoration(
          labelStyle: TextStyle(height: 0.0, color: CoresApp.secundaria),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(const Radius.circular(12)),
            borderSide: BorderSide(color: CoresApp.principal, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(const Radius.circular(12)),
            borderSide: BorderSide(color: CoresApp.secundaria, width: 1.0),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
          suffixIcon: posIcone,
          prefixIcon: preIcone,
          labelText: label,
          hintText: rotulo),
    );
  }
}
