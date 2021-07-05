import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {

    var _opcoes = ["pedra", "papel", "tesoura"];
    var _numero = Random().nextInt(3);
    var _escolhaApp = _opcoes[_numero];

    // Exibicao da imagem escolhida pelo App
    switch (_escolhaApp) {
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

    // Validacao do ganhador
    // Usuario ganhador
    if ((escolhaUsuario == "pedra" && _escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && _escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && _escolhaApp == "papel")) {
      setState(() {
        _mensagem = "Você Venceu!! $escolhaUsuario vence $_escolhaApp";
      });
      // Usuario perde
    } else if ((escolhaUsuario == "pedra" && _escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && _escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && _escolhaApp == "pedra")) {
      setState(() {
        _mensagem = "Você Perdeu!! $_escolhaApp vence $escolhaUsuario";
      });
      // Empate
    } else{
      setState(() {
        _mensagem = "Jogo empatado!! $escolhaUsuario empata com $_escolhaApp";
      });
    }
  }

  // Onde é construído a interface do App
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JoKenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // 1text
          // 2imagem
          // 3text resultado
          // 4Linha 3 imagens
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: this._imagemApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          )
        ],
      ),
    );
  }
}
