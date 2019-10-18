import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_whatsapp/Cadastro.dart';
import 'package:flutter_app_whatsapp/Login.dart';
import 'package:flutter_app_whatsapp/telas/Configuracoes.dart';
import 'package:flutter_app_whatsapp/telas/Mensagens.dart';
import 'Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'RouteGenerator.dart';

/*
void main(){

  //FirebaseAuth auth = FirebaseAuth.instance;
  //auth.signOut();

  /*
  Firestore.instance
  .collection("usuarios")
  .document("001")
  .setData({"nome": "Helio"});
  */

  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/login": (context) => Login(),
      "/cadastro" : (context) => Cadastro(),
      "/home" : (context) => Home(),
      "/configuracoes" : (context) => Configuracoes(),
      "/mensagens" : (context) => Mensagens(),
    },
    home: Login(),
    theme: ThemeData(
        primaryColor: Color(0xff075E54),
        accentColor: Color(0xff25D366)
    ),
    debugShowCheckedModeBanner: false,
  ));

}
*/

void main(){
  runApp(MaterialApp(
    home: Login(),
    theme: ThemeData(
        primaryColor: Color(0xff075E54),
        accentColor: Color(0xff25D366)
    ),
    initialRoute: "/",
    onGenerateRoute: RouteGenerator.generateRoute,
    debugShowCheckedModeBanner: false,
  ));

}
