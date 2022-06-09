import 'package:flutter/material.dart';
import 'dart:math';
//importar para animações

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Opção Selecionada: " + escolhaUsuario);
    print("Opção do App: " + escolhaApp);

// exibe  a imageme da escolha do app:
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });
        break;

      case "papel":
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });
        break;

      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;
    }

    //validação:
// caso o usuário ganhe:

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      setState(() {
        this._mensagem = "Você ganhou! 😁";
      });

//caso o app ganhe:
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel")) {
      setState(() {
        this._mensagem = "Você perdeu! 😢";
      });

//caso dê empate:
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "pedra") ||
        (escolhaApp == "papel" && escolhaUsuario == "papel") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "tesoura")) {
      setState(() {
        this._mensagem = "Empatee! 😮";
      });
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    var i = 117;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 98, 5, 173),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.back_hand_outlined),
            SizedBox(
              width: 10,
            ),
            Text("JokenPo"),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "O App escolheu:",
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 3,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Image(
            image: this._imagemApp,
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 3,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("imagens/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("imagens/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("imagens/tesoura.png", height: 100),
              ),
            ],
          ),

          //ANIMAÇÃO

          Image.asset("imagens/pac.gif"),
          /*
          Lottie.network(
              'https://assets4.lottiefiles.com/private_files/lf30_aYiP6b.json', ),*/

          Text(
            "By Franklin Volgan",
            style: TextStyle(
              color: Color.fromARGB(255, 236, 236, 236),
              fontSize: 14,
              letterSpacing: 2
            ),
          )
        ],
      ),
    );
  }
}
