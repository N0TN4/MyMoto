import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mymoto/Modelos/usuario_logado.dart';
import 'package:mymoto/Modelos/usuario_model.dart';
import 'package:mymoto/Paginas/Oficina/tela_oficina_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TelaOficina extends StatefulWidget {
  @override
  _TelaOficinaState createState() => _TelaOficinaState();
}

class _TelaOficinaState extends State<TelaOficina> {
  int indiceDaPagina = 0; // controla a bottom navigation
  // inicializa com prevenção

  TelaOficinaBloc _blocOficina = new TelaOficinaBloc();
  @override
  void initState() {
    // TODO: implement initState
    print("${UsuarioLogado.usuario.id}");
    _blocOficina.getUsuarioMoto();
    super.initState();

    // é necessário isso no meu celular, pois os botões nativos do android fica em cima da BottomNavigation
  }

  @override
  Widget build(BuildContext context) {
    // colocado retorno Widget só para entendimento que uma função
    // pode retornar um componente e ser manipulada pelos parametros
    //
    // parametro com { }  dentro do ( ) "({variavel})"
    // por ser um atributo opcional.
    List<Color> cores = List<Color>();
    Color verde = Colors.green;
    Color amarelo = Colors.yellow;
    Color vermelho = Colors.red;
    cores.add(verde);
    cores.add(amarelo);
    cores.add(vermelho);

    Widget _criarComponenteDePercentual({num porcentagem}) {
      return LinearPercentIndicator(
        width: MediaQuery.of(context).size.width - 80,
        animation: true,
        lineHeight: 26.0,
        animationDuration: 2500,
        percent: porcentagem / 100,
        center: Text("$porcentagem%",
            style: TextStyle(fontWeight: FontWeight.bold)),
        linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: porcentagem >= 70 && porcentagem <= 100
            ? verde
            : porcentagem >= 40 && porcentagem < 70 ? amarelo : vermelho,

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
      );
    }

    Widget _pularLinha({double valor}) {
      return SizedBox(height: valor == null ? 16 : valor);
    }

    Widget _mensagem(String texto) {
      return Text(
        texto,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Oficina",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: StreamBuilder<UsuarioModel>(
            stream: _blocOficina.usuarioMoto,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              } else {
                print((snapshot.data.moto.kmAtualTrocaOleo -
                        snapshot.data.moto.kmMaxTrocaOleo) /
                    snapshot.data.moto.kmMaxTrocaOleo);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, // eixo x da coluna no centro (row)
                  children: <Widget>[
                    _mensagem("Oléo"),
                    _criarComponenteDePercentual(
                      porcentagem: _blocOficina.calcularPorcentagem(
                          snapshot.data.moto.kmAtualTrocaOleo,
                          snapshot.data.moto
                              .kmMaxTrocaOleo), // manipula o componente
                    ),
                    _pularLinha(),
                    // esse valor de porcentagem na verdade vai ser o calculo que está vindo do backend
                    // aqui vai ter uma lista envolta de um StreamBuilder no futuro.
                    _mensagem("Acelerador"),
                    _criarComponenteDePercentual(
                      porcentagem: _blocOficina.calcularPorcentagem(
                          snapshot.data.moto.kmAtualAcelerador,
                          snapshot.data.moto.kmMaxAcelerador),
                    ),
                    _pularLinha(),
                    _mensagem("Vela de ignição"),
                    _criarComponenteDePercentual(
                      porcentagem: _blocOficina.calcularPorcentagem(
                          snapshot.data.moto.kmAtualVela,
                          snapshot.data.moto.kmMaxVela),
                    ),
                    _pularLinha(),
                    _mensagem("Freio"),
                    _criarComponenteDePercentual(
                      porcentagem: _blocOficina.calcularPorcentagem(
                          snapshot.data.moto.kmAtualFreio,
                          snapshot.data.moto.kmMaxFreio),
                    ),
                    _pularLinha(),
                    _mensagem("Embreagem"),
                    _criarComponenteDePercentual(
                      porcentagem: _blocOficina.calcularPorcentagem(
                          snapshot.data.moto.kmAtualEmbreagem,
                          snapshot.data.moto.kmMaxEmbreagem),
                    ),
                    _pularLinha(),
                    _mensagem("Pneus"),
                    _criarComponenteDePercentual(
                      porcentagem: _blocOficina.calcularPorcentagem(
                          snapshot.data.moto.kmAtualPneus,
                          snapshot.data.moto.kmMaxPneus),
                    ),
                    _pularLinha(),
                    _mensagem("Suspensão"),
                    _criarComponenteDePercentual(
                      porcentagem: _blocOficina.calcularPorcentagem(
                          snapshot.data.moto.kmAtualSuspensao,
                          snapshot.data.moto.kmMaxSuspensao),
                    ),
                  ],
                );
              }
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey, // verificar cores chrome white
        currentIndex: indiceDaPagina, // aqui atribui a variavel criada
        selectedIconTheme: IconThemeData(
          color: Colors.red,
        ),
        selectedItemColor: Colors.red,

        items: [
          BottomNavigationBarItem(
            title: Text("Prevenção"),
            icon: IconButton(
                icon: Icon(
                  Icons.trip_origin,
                  //color: Colors.pink, // a cor é setada quando o usuário tocar
                  size: 24.0,
                  semanticLabel: 'Prevenção',
                ),
                onPressed: () {
                  // quando tocar
                  // vai setar o indice da pagina como 0
                  setState(() {
                    indiceDaPagina = 0;
                  });
                  // todo: PageView
                  // quando tocar em prevenção ele vai enviar o indice para a pageView
                  // a page view vai verificar se é 0, e vai mostrar os valores da pagina atual
                }),
          ),
          BottomNavigationBarItem(
            title: Text("Manutenção"),
            icon: IconButton(
                icon: Icon(
                  Icons.trip_origin,
                  //color: Colors.blue,
                  size: 24.0,
                  semanticLabel: 'Manutenção',
                ),
                onPressed: () {
                  // quando tocar
                  // vai setar o indice da pagina como 1
                  setState(() {
                    indiceDaPagina = 1;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
