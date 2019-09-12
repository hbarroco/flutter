import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  //Variables
  var _titleApp = "JokenPo da SOFIA";
  var _opponentChoice = "Escolha do Adiversário";
  var _imageApp = AssetImage("images/padrao.png");
  var _message = "Escolha uma opção abaixo";

  void _choiceSelected(String userChoice) {
    var options = ["pedra", "papel", "tesoura"];
    var number = Random().nextInt(3);
    var appChoice = options[number];

    print("Escolha do App: " + appChoice);
    print("Escolha do usuario: " + userChoice);


    //Exibição da imagem escolhida pelo App
    switch (appChoice) {
      case "pedra" :
        setState(() {
          this._imageApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel" :
        setState(() {
          this._imageApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura" :
        setState(() {
          this._imageApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    //Validação do ganhador
    //Usuario Ganhador
    if (
    (userChoice == "pedra" && appChoice == "tesoura") ||
        (userChoice == "tesoura" && appChoice == "papel") ||
        (userChoice == "papel" && appChoice == "pedra")
    ) {
      setState(() {
        this._message = "Parabéns!!! Você ganhou :)";
      });
      //App Ganhador
    } else if (
    (appChoice == "pedra" && userChoice == "tesoura") ||
        (appChoice == "tesoura" && userChoice == "papel") ||
        (appChoice == "papel" && userChoice == "pedra")
    ) {
      setState(() {
        this._message = "Você perdeu :(";
      });
    } else {
      setState(() {
        this._message = "Empatamos ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._titleApp),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //1) Text
        //2) Image
        //3) text Resultado
        //4) Linha 3 Images
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._opponentChoice,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imageApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                  onTap: () => _choiceSelected("pedra"),
                  child: Image.asset("images/pedra.png", height: 100,)
              ),
              GestureDetector(
                  onTap: () => _choiceSelected("papel"),
                  child: Image.asset("images/papel.png", height: 100,)
              ),
              GestureDetector(
                  onTap: () => _choiceSelected("tesoura"),
                  child: Image.asset("images/tesoura.png", height: 100,)
              )
            ],
          )
        ],
      ),
    );
  }
}


