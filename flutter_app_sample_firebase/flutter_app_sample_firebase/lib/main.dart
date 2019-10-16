import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{

  Firestore db = Firestore.instance;


  //INSERT or UPDATE
  /*db.collection("usuarios")
      .document("002")
  .setData(
    {
      "nome" : "Ana Maria Silva",
      "idade" : "25"
    }
  );*/


  //INSERT
  /*DocumentReference ref = await db.collection("noticias")
  .add(
      {
        "titulo" : "Ondas de calor em São Paulo",
        "descricao" : "texto de exemplo..."
      }
  );*/

  // INSERT or UPDATE
  /*db.collection("noticias")
      .document("-LhaOOJeVlsPbbAoZaql")
      .setData(
      {
        "titulo" : "Ondas de calor em São Paulo alterado",
        "descricao" : "texto de exemplo..."
      }
  );*/


  //DELETE
  /*db.collection("usuarios").document("003").delete();*/


  //SELECT by Document
  /*DocumentSnapshot snapshot = await db.collection("usuarios")
      .document("002")
      .get();

  var dados = snapshot.data;
  print("dados nome: " + dados["nome"] + " idade: " + dados["idade"] );*/

  //SELECT by Collection
  /*QuerySnapshot querySnapshot = await db
      .collection("usuarios")
      .getDocuments();

  //print("dados usuarios: " + querySnapshot.documents.toString() );

  for( DocumentSnapshot item in querySnapshot.documents ){
    var dados = item.data;
    print("dados usuarios: " + dados["nome"] + " - " + dados["idade"] );
  }*/

  //SELECT with Listen
  /*db.collection("usuarios").snapshots().listen(
          ( snapshot ){

        for( DocumentSnapshot item in snapshot.documents ){
          var dados = item.data;
          print("dados usuarios: " + dados["nome"] + " - " + dados["idade"] );
        }

      }
  );*/

  //SELECT with Custom Filters
  /*var pesquisa = "ana";
  QuerySnapshot querySnapshot = await db.collection("usuarios")
  //.where("nome", isEqualTo: "jamilton")
  //.where("idade", isEqualTo: 31)
  //.where("idade", isGreaterThan: 15)//< menor, > maior, >= maior ou igual, <= menor ou igual
  //.where("idade", isLessThan: 30)
  //descendente (do maior para o menor) ascendente (do menor para o maior)
  //.orderBy("idade", descending: true )
  //.orderBy("nome", descending: false )
  //.limit(1)
  //m  m
  //10...15
      .where("nome", isGreaterThanOrEqualTo: pesquisa)
      .where("nome", isLessThanOrEqualTo: pesquisa + "\uf8ff" )
      .getDocuments();

  for( DocumentSnapshot item in querySnapshot.documents ){
    var dados = item.data;
    print("filtro nome: ${dados["nome"]} idade: ${dados["idade"]}");
  }*/

  //Autenticando Usuários
  FirebaseAuth auth = FirebaseAuth.instance;

  /* Criando usuário com e-mail e senha */
  String email = "jamilton@gmail.com";
  String senha = "123456";

  /*
  auth.createUserWithEmailAndPassword(
      email: email,
      password: senha
  ).then((firebaseUser){
    print("novo usuario: sucesso!! e-mail: " + firebaseUser.email );
  }).catchError((erro){
    print("novo usuario: erro " + erro.toString() );
  });*/

  //auth.signOut();

  /* Logando usuário */
  /*
  auth.signInWithEmailAndPassword(
      email: email,
      password: senha
  ).then((firebaseUser){

    print("Logar usuario: sucesso!! e-mail: " + firebaseUser.email );
  }).catchError((erro){
    print("Logar usuario: erro " + erro.toString() );
  });*/

  auth.signOut();

  FirebaseUser usuarioAtual = await auth.currentUser();
  if( usuarioAtual != null ){//logado
    print("Usuario atual logado email: " + usuarioAtual.email );
  }else{//deslogado
    print("Usuario atual está DESLOGADO!!");
  }



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
