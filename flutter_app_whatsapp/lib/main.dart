import 'package:flutter/material.dart';
import 'Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(){

  Firestore.instance
  .collection("usuarios")
  .document("001")
  .setData({"nome": "Helio"});

  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}