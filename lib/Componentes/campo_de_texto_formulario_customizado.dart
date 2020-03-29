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

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: TextFormField(
        enabled: ativo,
        
        maxLines: linhasMax,
        focusNode: focusNode,
        textCapitalization:
            capitalizacao == null ? TextCapitalization.none : capitalizacao,
        onFieldSubmitted: campoSubmetido,
        keyboardType: tipoDoInput,
        controller: controlador,
        validator: required == true
            ? (value) => value.isEmpty ? 'campo obrigatorio' : null
            : null,
        decoration: InputDecoration(
            labelStyle: TextStyle(height: 0.0, color: tema.primaryColor),
            
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            suffixIcon: posIcone,
            prefixIcon: preIcone,
            labelText: label,
            hintText: rotulo),
      ),
    );
  }
}
