import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
