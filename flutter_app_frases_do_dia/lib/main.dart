import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases = [
    "Sou apenas um pequeno planeta que se perde diariamente em todo o seu universo.",
    "Novas amizades serão sempre bem-vindas para darem cor e alegria ao meu dia a dia.",
    "Gratidão não é pagamento, mas um reconhecimento que se demonstra no dia a dia.",
    "Nem toda mudança importante acontece de repente e faz barulho, algumas são silenciosas e vão se fazendo no dia a dia."
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase() {
    // 0, 1 , 2, 3
    var numeroSorteado = Random().nextInt(_frases.length);

    setState(() {
      _fraseGerada = _frases[ numeroSorteado ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Frases do Dia"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/logo.png"),
                Text(
                  _fraseGerada,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Colors.black
                  ),
                ),
                RaisedButton(
                  child: Text(
                    "Nova Frase",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  color: Colors.green,
                  onPressed: _gerarFrase,
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: /*BottomAppBar(
        color: Colors.lightGreen,
        child: Padding(
          padding: EdgeInsets.all(16),
          child:  Row(
            children: <Widget>[
              Text("Obrigado por Participar"),
            ],
          ),
        ),
      ),*/
        BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 0, // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle),
                title: Text('Players'),
                backgroundColor: Colors.red,),
              BottomNavigationBarItem(icon: Icon(Icons.whatshot),
                  title: Text('Trending'),
                  backgroundColor: Colors.blueAccent),
              BottomNavigationBarItem(icon: Icon(Icons.access_time),
                  title: Text('Highlights'),
                  backgroundColor: Colors.yellow)
            ]
        )
    );
  }
}
