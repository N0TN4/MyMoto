// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:mymoto/Componentes/cores_app.dart';
// import 'package:mymoto/Modelos/usuario_logado.dart';
// import 'package:mymoto/Modelos/usuario_model.dart';
// import 'package:mymoto/Paginas/Oficina/tela_oficina_bloc.dart';
// import 'package:mymoto/notificacao/notificao_manutencao.dart';
// import 'package:numberpicker/numberpicker.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

// class NavegacaoOficina extends StatefulWidget {
//   @override
//   _NavegacaoOficinaState createState() => _NavegacaoOficinaState();
// }

// class _NavegacaoOficinaState extends State<NavegacaoOficina> {
//   TelaOficinaBloc _blocOficina = new TelaOficinaBloc();
//   int diasEscolhidos = 0;
//   NotificaoManutencao notificaoDeAlerta = NotificaoManutencao();

//   notificaoProgramada(UsuarioModel usuarioMoto, mediaKmDiaria, String peca){
//   var alertaManutencao = int.parse((usuarioMoto.moto.kmMaxTrocaOleo
//    / 4).toStringAsFixed(0));

//   DateTime dataAtual = DateTime.now();

//   num diferencaDias = int.parse(alertaManutencao.toString()) /
//    int.parse(mediaKmDiaria.toString());

//   var dataDiferencaManutencao = dataAtual.subtract(Duration(
//     days: int.parse(diferencaDias.toStringAsFixed(0))));

//   var dias = DateTime.now().difference(dataDiferencaManutencao);
//   return notificaoDeAlerta.notificar(dias: dias.inDays, peca: peca);
//   }

//   @override
//   void initState() {
//     print("${UsuarioLogado.usuario.id}");
//     _blocOficina.getUsuarioMoto();
//     super.initState();

//     // é necessário isso no meu celular, pois os botões nativos do android fica em cima da BottomNavigation
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Container(
//                 child: Text(
//                   "Olá ${UsuarioLogado.usuario.nome}, esse é o estado em média atual da sua motocicleta, " +
//                       "pressione o botão acima para confirmar as suas manutenções.",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//               ),
//             ),
//             StreamBuilder<UsuarioModel>(
//                 stream: _blocOficina.usuarioMoto,
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Container(
//                       child: Center(
//                         child: CircularProgressIndicator(),
//                       ),
//                     );
//                   } else {
//                     print((snapshot.data.moto.kmAtualTrocaOleo -
//                             snapshot.data.moto.kmMaxTrocaOleo) /
//                         snapshot.data.moto.kmMaxTrocaOleo);
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Card(
//                         elevation: 10,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment
//                                 .center, // eixo x da coluna no centro (row)
//                             children: <Widget>[
//                               _criarComponenteDePercentual(
//                                 tipo: "Oléo",
//                                 usuarioMoto: snapshot.data,
//                                 porcentagem: _blocOficina.calcularPorcentagem(
//                                     snapshot.data.moto.kmAtualTrocaOleo,
//                                     snapshot.data.moto
//                                         .kmMaxTrocaOleo), // manipula o componente
//                               ),
//                               _pularLinha(),
//                               // esse valor de porcentagem na verdade vai ser o calculo que está vindo do backend
//                               // aqui vai ter uma lista envolta de um StreamBuilder no futuro.

//                               _criarComponenteDePercentual(
//                                 tipo: "Acelerador",
//                                 usuarioMoto: snapshot.data,
//                                 porcentagem: _blocOficina.calcularPorcentagem(
//                                     snapshot.data.moto.kmAtualAcelerador,
//                                     snapshot.data.moto.kmMaxAcelerador),
//                               ),
//                               _pularLinha(),

//                               _criarComponenteDePercentual(
//                                 tipo: "Vela de ignição",
//                                 usuarioMoto: snapshot.data,
//                                 porcentagem: _blocOficina.calcularPorcentagem(
//                                     snapshot.data.moto.kmAtualVela,
//                                     snapshot.data.moto.kmMaxVela),
//                               ),
//                               _pularLinha(),

//                               _criarComponenteDePercentual(
//                                 tipo: "Freio",
//                                 usuarioMoto: snapshot.data,
//                                 porcentagem: _blocOficina.calcularPorcentagem(
//                                     snapshot.data.moto.kmAtualFreio,
//                                     snapshot.data.moto.kmMaxFreio),
//                               ),
//                               _pularLinha(),

//                               _criarComponenteDePercentual(
//                                 tipo: "Embreagem",
//                                 usuarioMoto: snapshot.data,
//                                 porcentagem: _blocOficina.calcularPorcentagem(
//                                     snapshot.data.moto.kmAtualEmbreagem,
//                                     snapshot.data.moto.kmMaxEmbreagem),
//                               ),
//                               _pularLinha(),

//                               _criarComponenteDePercentual(
//                                 tipo: "Pneus",
//                                 usuarioMoto: snapshot.data,
//                                 porcentagem: _blocOficina.calcularPorcentagem(
//                                     snapshot.data.moto.kmAtualPneus,
//                                     snapshot.data.moto.kmMaxPneus),
//                               ),
//                               _pularLinha(),

//                               _criarComponenteDePercentual(
//                                 tipo: "Suspensão",
//                                 usuarioMoto: snapshot.data,
//                                 porcentagem: _blocOficina.calcularPorcentagem(
//                                     snapshot.data.moto.kmAtualSuspensao,
//                                     snapshot.data.moto.kmMaxSuspensao),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//                 }),
//             SizedBox(
//               height: 70,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _pularLinha({double valor}) {
//     return SizedBox(height: valor == null ? 16 : valor);
//   }

//   Widget _criarComponenteDePercentual(
//       {num porcentagem, String tipo, UsuarioModel usuarioMoto}) {
//     return Row(
//       children: <Widget>[
//         Expanded(
//           child: Column(
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     tipo,
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: porcentagem <= 0
//                             ? CoresApp.principal
//                             : Colors.black),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   porcentagem <= 0
//                       ? Icon(Icons.warning, color: CoresApp.principal)
//                       : Container(),
//                 ],
//               ),

//               //msg
//               LinearPercentIndicator(
//                 //width: MediaQuery.of(context).size.width - 80,
//                 animateFromLastPercent: true,

//                 animation: true,

//                 trailing: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: IconButton(
//                     icon: Icon(Icons.settings, color: CoresApp.secundaria),
//                     onPressed: () {
//                       setState(() {
//                         dialogoConsertaPeca(usuarioMoto, tipo);
//                       });
//                     },
//                   ),
//                 ),
//                 lineHeight: 26.0,
//                 animationDuration: 2500,
//                 percent: porcentagem / 100,
//                 center: Text("$porcentagem%",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: porcentagem <= 0
//                             ? CoresApp.principal
//                             : Colors.black)),
//                 linearStrokeCap: LinearStrokeCap.roundAll,
//                 progressColor: porcentagem >= 70 && porcentagem <= 100
//                     ? Colors.green
//                     : porcentagem >= 40 && porcentagem < 70
//                         ? Colors.yellow
//                         : Colors.red,

//                 //progressColor e linearGradient não pode ser utilizados juntos
// //        linearGradient: LinearGradient(
// //          // para fazer:
// //          // 30 - 30 - 30
// //          // verificar variavel que está vindo como parâmetro
// //          // percontagem está entre 70 e 100? então mostrar 3 cores, (laranja, amarelo, limão)
// //          // porcentagem está entre 40 e 70? então mostra 2 cores (laranja, amarelo e limão)
// //          // porcentagem está 20 e 50 ? mostrar apenas 1 cor = laranja,
// //          // posibilidade de colocar um vermelho mas escuro para porcentagens abaixo de 20
// //
// //          //dicas : operador ternário já que o if nao pode ser utilizado dentro de um Widget
// //          //colors: porcentagem >= 70 && porcentagem <= 100 ? Colors.green
// //          colors: [
// //            porcentagem >= 70 && porcentagem <= 100 ? cor1 :
// //            porcentagem >= 40 && porcentagem < 70 ? cor2 : cor3,
// //            cor3,
// //          ],
// //          // array de cores para fazer o gradient
// //        ),

//                 padding: EdgeInsets.only(left: 60),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   dialogoConsertaPeca(UsuarioModel usuarioMoto, String tipo) {
//     diasEscolhidos = 0;

//     return showDialog(
//       context: context,
//       builder: (context) => StatefulBuilder(builder: (context, setState) {
//         return new AlertDialog(
//           content: Container(
//             child: Wrap(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(top: 28),
//                   child: new Text(
//                     "Consertei esta peça há ",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                   ),
//                 ),
//                 NumberPicker.integer(
//                     initialValue: diasEscolhidos,
//                     minValue: 0,
//                     maxValue: 99,
//                     itemExtent: 25,
//                     listViewWidth: 40,
//                     onChanged: (value) {
//                       setState(() {
//                         diasEscolhidos = value;
//                       });
//                     }),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 28),
//                   child: Text(
//                     " dias atrás",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: FlatButton(
//                 child: Row(
//                   children: <Widget>[
//                     Text(
//                       "Não",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Icon(Icons.cancel, color: Colors.red)
//                   ],
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: FlatButton(
//                 child: Row(children: <Widget>[
//                   Text(
//                     "Sim",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                         color: Colors.green),
//                   ),
//                   SizedBox(
//                     width: 4,
//                   ),
//                   Icon(Icons.check_circle, color: Colors.green),
//                 ]),
//                 onPressed: () {
//                   setState(() {
//                     //Navigator.of(context).pop();
//                     final mediaKmDiaria = usuarioMoto.moto.mediaDiariaKm;
//                     // start lógica de dias que o usuário está alterando/consertando a peça.
//                     // ao tocar em sim, significa que ele trocou, vai mandar um request para a
//                     // api e alterare bloc da peça (aniação na view de porcentagem)
//                     switch (tipo) {
//                       case "Oléo":
//                         usuarioMoto.moto.kmAtualTrocaOleo =
//                             mediaKmDiaria * diasEscolhidos;
//                             notificaoProgramada(usuarioMoto, mediaKmDiaria, tipo);
//                         break;
//                       case "Acelerador":
//                         usuarioMoto.moto.kmAtualAcelerador =
//                             mediaKmDiaria * diasEscolhidos;
//                             notificaoProgramada(usuarioMoto, mediaKmDiaria, tipo);
//                         break;
//                       case "Vela de ignição":
//                         usuarioMoto.moto.kmAtualVela =
//                             mediaKmDiaria * diasEscolhidos;
//                             notificaoProgramada(usuarioMoto, mediaKmDiaria, tipo);
//                         break;
//                       case "Freio":
//                         usuarioMoto.moto.kmAtualFreio =
//                             mediaKmDiaria * diasEscolhidos;
//                             notificaoProgramada(usuarioMoto, mediaKmDiaria, tipo);
//                         break;
//                       case "Embreagem":
//                         usuarioMoto.moto.kmAtualEmbreagem =
//                             mediaKmDiaria * diasEscolhidos;
//                             notificaoProgramada(usuarioMoto, mediaKmDiaria, tipo);
//                         break;
//                       case "Pneus":
//                         usuarioMoto.moto.kmAtualPneus =
//                             mediaKmDiaria * diasEscolhidos;
//                             notificaoProgramada(usuarioMoto, mediaKmDiaria, tipo);
//                         break;
//                       case "Suspensão":
//                         usuarioMoto.moto.kmAtualSuspensao =
//                             mediaKmDiaria * diasEscolhidos;
//                             notificaoProgramada(usuarioMoto, mediaKmDiaria, tipo);
//                         break;

//                       default:
//                         return;
//                     }
//                     _blocOficina.mudarUsuarioMoto(usuarioMoto);

//                     // end lógica
//                     showDialog(
//                       context: context,
//                       barrierDismissible: false,
//                       builder: (context) =>
//                           Center(child: new CircularProgressIndicator()),
//                     );

//                     Timer(Duration(seconds: 2), () {
//                       return _blocOficina.submit().then((response) {
//                         setState(() {});
//                         Navigator.of(context).pop();
//                         Navigator.of(context).pop();
//                       });
//                     });
//                   });
//                 },
//               ),
//             ), // loading
//           ],
//         );
//       }),
//     );
//   }
// }