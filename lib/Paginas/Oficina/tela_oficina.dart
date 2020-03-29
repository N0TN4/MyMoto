import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TelaOficina extends StatefulWidget {
  @override
  _TelaOficinaState createState() => _TelaOficinaState();
}

class _TelaOficinaState extends State<TelaOficina> {
  int indiceDaPagina = 0; // controla a bottom navigation
  // inicializa com prevenção
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(
        []); // inicia o aplicativo em tela cheia
    // é necessário isso no meu celular, pois os botões nativos do android fica em cima da BottomNavigation
  }

  @override
  Widget build(BuildContext context) {
    // colocado retorno Widget só para entendimento que uma função
    // pode retornar um componente e ser manipulada pelos parametros
    //
    // parametro com { }  dentro do ( ) "({variavel})"
    // por ser um atributo opcional.

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
        //progressColor: Colors.green,
        //progressColor e linearGradient não pode ser utilizados juntos
        linearGradient: LinearGradient(
          // para fazer:
          // 30 - 30 - 30
          // verificar variavel que está vindo como parâmetro
          // percontagem está entre 70 e 100? então mostrar 3 cores, (laranja, amarelo, limão)
          // porcentagem está entre 40 e 70? então mostra 2 cores (laranja, amarelo e limão)
          // porcentagem está 20 e 50 ? mostrar apenas 1 cor = laranja,
          // posibilidade de colocar um vermelho mas escuro para porcentagens abaixo de 20

          //dicas : operador ternário já que o if nao pode ser utilizado dentro de um Widget

          colors: [
            Colors.deepOrange,
            Colors.yellow,
            Colors.limeAccent,
          ],
          // array de cores para fazer o gradient
        ),
        padding: EdgeInsets.only(left: 60),
      );
    }

    Widget _pularLinha({double valor}) {
      return SizedBox(
        height: valor == null ? 16 : valor
      );
    }
    Widget _mensagem(String texto){
      return Text(texto, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.center, // eixo x da coluna no centro (row)
          children: <Widget>[
            _mensagem("Funcionamento acelerador"),
            _criarComponenteDePercentual(
              porcentagem: 70, // manipula o componente
            ),
            _pularLinha(),
            // esse valor de porcentagem na verdade vai ser o calculo que está vindo do backend
            // aqui vai ter uma lista envolta de um StreamBuilder no futuro.
            _mensagem("Filtro de ar"),
            _criarComponenteDePercentual(
              porcentagem: 100,
            ),
            _pularLinha(),
            _mensagem("Sinalização"),
            _criarComponenteDePercentual(
              porcentagem: 100,
            ),
            _pularLinha(),
            _mensagem("Cabo de freio"),
            _criarComponenteDePercentual(
              porcentagem: 100,
            ),
            _pularLinha(),
            _mensagem("Cabo de embreagem"),
            _criarComponenteDePercentual(
              porcentagem: 100,
            ),
            _pularLinha(),
            _mensagem("Tambor freio"),
            _criarComponenteDePercentual(
              porcentagem: 100,
            ),
          ],
        ),
      ),

      // já existe um componente BottomNavigation bar ao invéz de uma row
      // o que otimiza a performance
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
