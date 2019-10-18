import 'package:flutter/material.dart';
import 'package:flutter_app_whatsapp/model/Usuario.dart';


class Mensagens extends StatefulWidget {

  Usuario contato;

  Mensagens(this.contato);

  @override
  _MensagensState createState() => _MensagensState();
}

class _MensagensState extends State<Mensagens> {

  List<String> listaMensagens = [
    "Olá meu amigo, tudo bem?",
    "Tudo ótimo!!! e contigo?",
    "Estou muito bem!! queria ver uma coisa contigo, você vai na corrida de sábado?",
    "Não sei ainda :(",
    "Pq se você fosse, queria ver se posso ir com você...",
    "Posso te confirma no sábado? vou ver isso",
    "Opa! tranquilo",
    "Excelente!!",
    "Estou animado para essa corrida, não vejo a hora de chegar! ;) ",
    "Vai estar bem legal!! muita gente",
    "vai sim!",
    "Lembra do carro que tinha te falado",
    "Que legal!!"
  ];
  TextEditingController _controllerMensagem = TextEditingController();

  _enviarMensagem(){

  }

  _enviarFoto(){

  }

  @override
  Widget build(BuildContext context) {

    var caixaMensagem = Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: TextField(
                controller: _controllerMensagem,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 8, 32, 8),
                    hintText: "Digite uma mensagem...",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)
                    ),
                    prefixIcon: IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: _enviarFoto
                    )
                ),
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Color(0xff075E54),
            child: Icon(Icons.send, color: Colors.white,),
            mini: true,
            onPressed: _enviarMensagem,
          )
        ],
      ),
    );

    var listView = Expanded(
      child: ListView.builder(
          itemCount: listaMensagens.length,
          itemBuilder: (context, indice){

            double larguraContainer = MediaQuery.of(context).size.width * 0.8;

            //larguraContainer -> 100
            //x                -> 80

            //Define cores e alinhamentos
            Alignment alinhamento = Alignment.centerRight;
            Color cor = Color(0xffd2ffa5);
            if( indice % 2 == 0 ){//par
              alinhamento = Alignment.centerLeft;
              cor = Colors.white;
            }

            return Align(
              alignment: alinhamento,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Container(
                  width: larguraContainer,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: cor,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Text(
                    listaMensagens[indice],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            );

          }
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.contato.nome),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("imagens/bg.png"),
                fit: BoxFit.cover
            )
        ),
        child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  listView,
                  caixaMensagem,
                ],
              ),
            )
        ),
      ),
    );
  }
}
