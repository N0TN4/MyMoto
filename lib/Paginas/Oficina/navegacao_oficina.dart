import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoto/Componentes/cores_app.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';
import 'package:mymoto/Modelos/usuario_model.dart';
import 'package:mymoto/Paginas/Oficina/tela_oficina_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class NavegacaoOficina extends StatefulWidget {
  @override
  _NavegacaoOficinaState createState() => _NavegacaoOficinaState();
}

class _NavegacaoOficinaState extends State<NavegacaoOficina> {
  TelaOficinaBloc _blocOficina = new TelaOficinaBloc();

  @override
  void initState() {
    print("${UsuarioLogado.usuario.id}");
    _blocOficina.getUsuarioMoto();
    super.initState();

    // é necessário isso no meu celular, pois os botões nativos do android fica em cima da BottomNavigation
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Text(
                  "Olá ${UsuarioLogado.usuario.nome}, esse é o estado em média atual da sua motocicleta, " +
                      "pressione o botão acima para confirmar as suas manutenções.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            StreamBuilder<UsuarioModel>(
                stream: _blocOficina.usuarioMoto,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    print((snapshot.data.moto.kmAtualTrocaOleo -
                            snapshot.data.moto.kmMaxTrocaOleo) /
                        snapshot.data.moto.kmMaxTrocaOleo);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // eixo x da coluna no centro (row)
                            children: <Widget>[
                              _criarComponenteDePercentual(
                                tipo: "Oléo",
                                usuarioMoto: snapshot.data,
                                porcentagem: _blocOficina.calcularPorcentagem(
                                    snapshot.data.moto.kmAtualTrocaOleo,
                                    snapshot.data.moto
                                        .kmMaxTrocaOleo), // manipula o componente
                              ),
                              _pularLinha(),
                              // esse valor de porcentagem na verdade vai ser o calculo que está vindo do backend
                              // aqui vai ter uma lista envolta de um StreamBuilder no futuro.

                              _criarComponenteDePercentual(
                                tipo: "Acelerador",
                                usuarioMoto: snapshot.data,
                                porcentagem: _blocOficina.calcularPorcentagem(
                                    snapshot.data.moto.kmAtualAcelerador,
                                    snapshot.data.moto.kmMaxAcelerador),
                              ),
                              _pularLinha(),

                              _criarComponenteDePercentual(
                                tipo: "Vela de ignição",
                                usuarioMoto: snapshot.data,
                                porcentagem: _blocOficina.calcularPorcentagem(
                                    snapshot.data.moto.kmAtualVela,
                                    snapshot.data.moto.kmMaxVela),
                              ),
                              _pularLinha(),

                              _criarComponenteDePercentual(
                                tipo: "Freio",
                                usuarioMoto: snapshot.data,
                                porcentagem: _blocOficina.calcularPorcentagem(
                                    snapshot.data.moto.kmAtualFreio,
                                    snapshot.data.moto.kmMaxFreio),
                              ),
                              _pularLinha(),

                              _criarComponenteDePercentual(
                                tipo: "Embreagem",
                                usuarioMoto: snapshot.data,
                                porcentagem: _blocOficina.calcularPorcentagem(
                                    snapshot.data.moto.kmAtualEmbreagem,
                                    snapshot.data.moto.kmMaxEmbreagem),
                              ),
                              _pularLinha(),

                              _criarComponenteDePercentual(
                                tipo: "Pneus",
                                usuarioMoto: snapshot.data,
                                porcentagem: _blocOficina.calcularPorcentagem(
                                    snapshot.data.moto.kmAtualPneus,
                                    snapshot.data.moto.kmMaxPneus),
                              ),
                              _pularLinha(),

                              _criarComponenteDePercentual(
                                tipo: "Suspensão",
                                usuarioMoto: snapshot.data,
                                porcentagem: _blocOficina.calcularPorcentagem(
                                    snapshot.data.moto.kmAtualSuspensao,
                                    snapshot.data.moto.kmMaxSuspensao),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                }),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }

  Widget _pularLinha({double valor}) {
    return SizedBox(height: valor == null ? 16 : valor);
  }

  Widget _criarComponenteDePercentual(
      {num porcentagem, String tipo, UsuarioModel usuarioMoto}) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    tipo,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: porcentagem <= 0
                            ? CoresApp.principal
                            : Colors.black),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  porcentagem <= 0
                      ? Icon(Icons.warning, color: CoresApp.principal)
                      : Container(),
                ],
              ),

              //msg
              LinearPercentIndicator(
                //width: MediaQuery.of(context).size.width - 80,
                animation: true,

                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                    icon: Icon(Icons.settings, color: CoresApp.secundaria),
                    onPressed: () {
                      setState(() {
                        switch (tipo) {
                          case "Oléo":
                            usuarioMoto.moto.kmAtualTrocaOleo = 0;
                            _blocOficina.mudarUsuarioMoto(usuarioMoto);
                            break;
                          case "Acelerador":
                            usuarioMoto.moto.kmAtualAcelerador = 0;
                            _blocOficina.mudarUsuarioMoto(usuarioMoto);
                            break;
                          case "Vela de ignição":
                            usuarioMoto.moto.kmAtualVela = 0;
                            _blocOficina.mudarUsuarioMoto(usuarioMoto);
                            break;
                          case "Freio":
                            usuarioMoto.moto.kmAtualFreio = 0;
                            _blocOficina.mudarUsuarioMoto(usuarioMoto);
                            break;
                          case "Embreagem":
                            usuarioMoto.moto.kmAtualEmbreagem = 0;
                            _blocOficina.mudarUsuarioMoto(usuarioMoto);
                            break;
                          case "Pneus":
                            usuarioMoto.moto.kmAtualPneus = 0;
                            _blocOficina.mudarUsuarioMoto(usuarioMoto);
                            break;
                          case "Suspensão":
                            usuarioMoto.moto.kmAtualSuspensao = 0;
                            _blocOficina.mudarUsuarioMoto(usuarioMoto);
                            break;

                          default:
                            return;
                        }
                      });
                    },
                  ),
                ),
                lineHeight: 26.0,
                animationDuration: 2500,
                percent: porcentagem / 100,
                center: Text("$porcentagem%",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: porcentagem <= 0
                            ? CoresApp.principal
                            : Colors.black)),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: porcentagem >= 70 && porcentagem <= 100
                    ? Colors.green
                    : porcentagem >= 40 && porcentagem < 70
                        ? Colors.yellow
                        : Colors.red,

                //progressColor e linearGradient não pode ser utilizados juntos
//        linearGradient: LinearGradient(
//          // para fazer:
//          // 30 - 30 - 30
//          // verificar variavel que está vindo como parâmetro
//          // percontagem está entre 70 e 100? então mostrar 3 cores, (laranja, amarelo, limão)
//          // porcentagem está entre 40 e 70? então mostra 2 cores (laranja, amarelo e limão)
//          // porcentagem está 20 e 50 ? mostrar apenas 1 cor = laranja,
//          // posibilidade de colocar um vermelho mas escuro para porcentagens abaixo de 20
//
//          //dicas : operador ternário já que o if nao pode ser utilizado dentro de um Widget
//          //colors: porcentagem >= 70 && porcentagem <= 100 ? Colors.green
//          colors: [
//            porcentagem >= 70 && porcentagem <= 100 ? cor1 :
//            porcentagem >= 40 && porcentagem < 70 ? cor2 : cor3,
//            cor3,
//          ],
//          // array de cores para fazer o gradient
//        ),

                padding: EdgeInsets.only(left: 60),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
