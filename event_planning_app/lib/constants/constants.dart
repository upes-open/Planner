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
  static String appId = "1:294793366462:web:5b7b5503cecaf4db48c7ef";
  static String apiKey = "AIzaSyBmtbxkx8xCX5LstGxw79vkk2nevX3Kj90";
  static String messagingSenderId = "294793366462";
  static String projectId = "event-planning-application";

  static const primaryColor = Color.fromARGB(255, 137, 44, 220);
}

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}
