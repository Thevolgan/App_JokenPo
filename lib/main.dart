import 'package:flutter/material.dart';
import 'jogo.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Color.fromARGB(255, 83, 43, 148),
      brightness: Brightness.dark,
    ),
    home: Jogo(),
  ));
}