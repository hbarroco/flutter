import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _textoSalvo = "Nada Salvo!";
  TextEditingController _controllerCampo = TextEditingController();

  void _salvar() async {
    String _valorDigitado = _controllerCampo.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("Nome", _valorDigitado);
  }

  void _recuperar() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      if (prefs.containsKey("Nome")) {
        _textoSalvo = prefs.get("Nome");
      }
    });
  }

  void _remover() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove("Nome");

    setState(() {
      _textoSalvo = "Nada Salvo!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de Dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text(
              _textoSalvo,
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Digite algo"
              ),
              controller: _controllerCampo,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                    onPressed: _salvar,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Recuperar",
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                    onPressed: _recuperar,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Remover",
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                    onPressed: _remover,
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
