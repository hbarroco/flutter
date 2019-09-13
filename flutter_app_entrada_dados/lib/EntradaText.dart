import 'package:flutter/material.dart';

class EntradaText extends StatefulWidget {
  @override
  _EntradaTextState createState() => _EntradaTextState();
}

class _EntradaTextState extends State<EntradaText> {
  var _titleApp = "Entrada de Dados";
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._titleApp),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              //text, number, emailAddress, datetime
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Digite um valor"
              ),
              //enabled: false,
              //maxLength: 2,
              //maxLengthEnforced: false,
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.green
              ),
              //obscureText: true,
              /*
              onChanged: (String texto){
                print("valor digitado:" +  texto);
              },*/
              onSubmitted: (String texto) {
                print("valor digitado:" + texto);
              },
              controller: _textEditingController,

            ),
          ),
          RaisedButton(
            child: Text("Salvar"),
            color: Colors.lightGreen,
            onPressed: () {
              print("valor digitado:" + _textEditingController.text);
            },
          )
        ],
      ),
    );
  }
}
