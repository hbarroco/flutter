import 'package:flutter/material.dart';
import 'package:flutter_app_whatsapp/model/Conversa.dart';

class AbaContatos extends StatefulWidget {
  @override
  _AbaContatosState createState() => _AbaContatosState();
}

class _AbaContatosState extends State<AbaContatos> {

  List<Conversa> listaConversas = [
    Conversa(
        "Ana Clara",
        "Olá tudo bem?",
        "https://firebasestorage.googleapis.com/v0/b/whatsappflutter-8635c.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=e96e8877-1fec-4794-91e6-fad492c12436"
    ),
    Conversa(
        "Pedro Silva",
        "Me manda o nome daquela série que falamos!",
        "https://firebasestorage.googleapis.com/v0/b/whatsappflutter-8635c.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=bd289032-56f9-4476-b383-72a2c59653c7"
    ),
    Conversa(
        "Marcela Almeida",
        "Vamos sair hoje?",
        "https://firebasestorage.googleapis.com/v0/b/whatsappflutter-8635c.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=6733fe64-5569-4bdd-85ad-91d9a4d17f47"
    ),
    Conversa(
        "José Renato",
        "Não vai acreditar no que tenho para te contar...",
        "https://firebasestorage.googleapis.com/v0/b/whatsappflutter-8635c.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=7d82248c-ce42-4382-80ac-7c6c9d132320"
    ),
    Conversa(
        "Jamilton Damasceno",
        "Curso novo!! depois dá uma olhada!!",
        "https://firebasestorage.googleapis.com/v0/b/whatsappflutter-8635c.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=22caff75-760e-41b8-aa12-4fb05dfd3982"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listaConversas.length,
        itemBuilder: (context, indice){

          Conversa conversa = listaConversas[indice];

          return ListTile(
            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            leading: CircleAvatar(
              maxRadius: 30,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage( conversa.caminhoFoto ),
            ),
            title: Text(
              conversa.nome,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
          );

        }
    );
  }
}
