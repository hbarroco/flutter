import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: App(),
  ));
}

class App extends StatelessWidget {

  _insertDB() {
    Firestore.instance
        .collection("usuarios")
        .document("pontuacao")
        .setData({"Carlos": "80", "Silvava": "340"});
  }

  @override
  Widget build(BuildContext context) {

    _insertDB();

    return Scaffold(
      appBar: AppBar(
        title: Text("Teste Firebase"),
      ),
      body: Column(
        children: <Widget>[
          Text("FIREBASE"),
        ],
      ),
    );
  }
}
