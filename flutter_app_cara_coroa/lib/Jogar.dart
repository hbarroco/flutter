import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_app_cara_coroa/Resultado.dart';

class Jogar extends StatefulWidget {
  @override
  _JogarState createState() => _JogarState();
}

class _JogarState extends State<Jogar> {

  void _exibirResultado(){

    var itens = ["cara", "coroa"];
    var numero = Random().nextInt( itens.length );
    var resultado = itens[numero];

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Resultado(resultado)
        ));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      //backgroundColor: Color.fromRGBO(255, 204, 128, 1),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset("imagens/logo.png"),
            GestureDetector(
              onTap: _exibirResultado,
              child: Image.asset("imagens/botao_jogar.png"),
            )
          ],
        ),
      ),
    );
  }
}
