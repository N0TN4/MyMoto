import 'package:flutter/material.dart';

class RelatarBug extends StatefulWidget {
  @override
  _RelatarBugState createState() => _RelatarBugState();
}

class _RelatarBugState extends State<RelatarBug> {
  final _ctrlEnviarMensagem = TextEditingController();
  final _ctrlEnviarTitulo = TextEditingController();
  final _chaveFormulario = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  final _chaveScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _chaveScaffold,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              setState(() {
                _validacaoFormulario();
              });
            },
          ),
        ],
        title: Text(
          "Reporte um bug",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Form(
        key: _chaveFormulario,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 24),
              TextFormField(
                controller: _ctrlEnviarMensagem,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor insira o título.';
                  }
                  return null;
                },
                maxLength: 50,
                maxLines: 1,
                decoration: InputDecoration(
                  counterText: "",
                  labelText: 'Título',
                  labelStyle: TextStyle(height: 0.0, color: Colors.red),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
                ),
              ),
              SizedBox(height: 16.0),
              Text("Relatar problema"),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _ctrlEnviarTitulo,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor insira seu report bug';
                  }
                  return null;
                },
                maxLength: 900,
                maxLines: 10,
                decoration: InputDecoration(
                  counterText: "",
                  labelStyle: TextStyle(height: 0.0, color: Colors.red),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
                ),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validacaoFormulario() {
    final _snackBar = SnackBar(content: Text("Campo não pode ser vazio."));
    bool _formularioOk = _chaveFormulario.currentState.validate();
    if (!_formularioOk) {
      return _chaveScaffold.currentState.showSnackBar(_snackBar);
    }
    print("enviado com sucesso!");
    return Navigator.pop(context);
  }

  @override
  void dispose() {
    _ctrlEnviarTitulo.dispose();
    _ctrlEnviarMensagem.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
