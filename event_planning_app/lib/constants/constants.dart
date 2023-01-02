import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color lightgreenshede = Color(0xFFF0FAF6);
Color lightgreenshede1 = Color(0xFFB2D9CC);
Color greenshede0 = Color(0xFF66A690);
Color greenshede1 = Color(0xFF93C9B5);
Color primarygreen = Color(0xFF1E3A34);
Color grayshade = Color(0xFF93B3AA);
Color colorAcent = Color(0xFF78C2A7);
Color cyanColor = Color(0xFF6D7E6E);

const kAnimationDuration = Duration(milliseconds: 200);

class Constants {
  static String appId = "1:696106708622:web:2c9887df6f1ecc3e00a3df";
  static String apiKey = "AIzaSyBClkTXNzeKK20XhhsIdTZMYAGruqfo6Mo";
  static String messagingSenderId = "696106708622";
  static String projectId = "chatapp-5b417";

  static const primaryColor = Color.fromARGB(255, 137, 44, 220);
}

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}
