import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoto/Componentes/cores_app.dart';
import 'package:mymoto/Modelos/moto.dart';
import 'package:mymoto/Paginas/MenuPrincipal/menu_principal.dart';
import 'package:mymoto/Paginas/Oficina/altera_moto_bloc.dart';

class TrocarMoto extends StatefulWidget {
  @override
  _TrocarMotoState createState() => _TrocarMotoState();
}

class _TrocarMotoState extends State<TrocarMoto> {
  AlteraMotoBloc _bloc = AlteraMotoBloc();

  @override
  void initState() {
    _bloc.getMotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[
            _busca(),
            StreamBuilder<List<Moto>>(
                stream: _bloc.motosBuscadas,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          // return Text("${snapshot.data[index].nome}");
                          return _criarCardMoto(snapshot.data[index]);
                        },
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

  _busca() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [CoresApp.secundaria, Colors.white.withOpacity(0)],
        //stops: _stops.map((s) => s + animation.value).toList(),
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.grey.shade200,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3.75,
                        blurRadius: 2,
                        offset: Offset(1, 3),
                      ),
                    ]),
                child: TextField(
                  onChanged: (txt) {
                    _bloc.buscarMotos(txt);
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 14.2),
                    hintText: 'Buscar',
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
            ),
            // IconButton(
            //   iconSize: 32,
            //   icon: Icon(Icons.filter_list),
            //   color: Colors.grey.shade500,
            //   onPressed: () {
            //     print('filter');
            //     return _onClickDialog(context);
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  _criarCardMoto(Moto moto) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: ListTile(
          title: Text(
            "${moto.nome ?? ""}",
            style: TextStyle(color: Colors.black),
          ),
          subtitle: Text("Cilindradas: ${moto.cilindradas}"),
          leading: Icon(
            Icons.motorcycle,
            size: 32,
            color: CoresApp.secundaria,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: CoresApp.secundaria,
          ),
          onTap: () {
            //select
            return botaoAcaoAlterarMoto(moto);
          },
        ),
      ),
    );
  }

  botaoAcaoAlterarMoto(Moto moto) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        content: new Text(
          "Você realmente deseja trocar a sua moto?",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              child: Row(
                children: <Widget>[
                  Text(
                    "Não",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(Icons.cancel, color: Colors.red)
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              child: Row(children: <Widget>[
                Text(
                  "Sim",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.green),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(Icons.check_circle, color: Colors.green),
              ]),
              onPressed: () {
                //Navigator.of(context).pop();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      Center(child: new CircularProgressIndicator()),
                );

                Timer(Duration(seconds: 2), () {
                  moto.kmAtualAcelerador = 0;
                  moto.kmAtualEmbreagem = 0;
                  moto.kmAtualFreio = 0;
                  moto.kmAtualPneus = 0;
                  moto.kmAtualSuspensao = 0;
                  moto.kmAtualTrocaOleo = 0;
                  moto.kmAtualVela = 0;

                  return _bloc.putNovaMotoUsuario(moto).then((response) {
                    setState(() {});
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => MenuPrincipal()),
                        (Route<dynamic> route) => false);
                  });
                });
              },
            ),
          ), // loading
        ],
      ),
    );

    //
  }
}
