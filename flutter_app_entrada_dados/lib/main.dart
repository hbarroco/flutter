import 'package:flutter/material.dart';
import 'package:flutter_app_entrada_dados/EntradaCheckBox.dart';
import 'package:flutter_app_entrada_dados/EntradaRadioButton.dart';
import 'package:flutter_app_entrada_dados/EntradaSlider.dart';
import 'package:flutter_app_entrada_dados/EntradaSwitch.dart';
import 'package:flutter_app_entrada_dados/EntradaText.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //home: EntradaText(),
    //home: EntradaCheckBox(),
    //home: EntradaRadioButton(),
    //home: EntradaSwitch(),
    home: EntradaSlider(),
  ));
}