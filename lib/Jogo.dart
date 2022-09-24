import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _resultado = '';

  void _selecionaImagem(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];

    _alteraImagemApp(escolhaApp);
    _declaraResultado(escolhaUsuario, escolhaApp);
  }

  void _declaraResultado(String escolhaUsuario, String escolhaApp) {
    var ganhou = "Você Ganhou";
    var perdeu = "Você Perdeu";
    var empate = "Empate";
    if (escolhaUsuario == "pedra" && escolhaApp == "tesoura") {
      _setstateResultado(ganhou);
    } else if (escolhaUsuario == "papel" && escolhaApp == "pedra") {
      _setstateResultado(ganhou);
    } else if (escolhaUsuario == "tesoura" && escolhaApp == "papel") {
      _setstateResultado(ganhou);
    } else if (escolhaUsuario == escolhaApp) {
      _setstateResultado(empate);
    } else {
      _setstateResultado(perdeu);
    }
  }

  void _setstateResultado(String resultado) {
    setState(() {
      _resultado = resultado;
    });
  }

  void _alteraImagemApp(String imagem) {
    setState(() {
      _imagemApp = AssetImage("images/$imagem.png");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        // ignore: prefer_const_constructors
        Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          // ignore: prefer_const_constructors
          child: Text("Escolha do App:",
              textAlign: TextAlign.center,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
        ),
        Image(image: this._imagemApp),
        Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          // ignore: prefer_const_constructors
          child: Text("Escolha uma opção abaixo:",
              textAlign: TextAlign.center,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _selecionaImagem("pedra"),
              child: Image.asset("images/pedra.png", height: 100),
            ),
            GestureDetector(
              onTap: () => _selecionaImagem("papel"),
              child: Image.asset("images/papel.png", height: 100),
            ),
            GestureDetector(
              onTap: () => _selecionaImagem("tesoura"),
              child: Image.asset("images/tesoura.png", height: 100),
            )
          ],
        ),
        Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Resultado: $_resultado",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
      ]),
    );
  }
}
