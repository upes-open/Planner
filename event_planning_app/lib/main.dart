import 'package:event_planning_app/constants/constants.dart';
import 'package:event_planning_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:event_planning_app/pages/onBoard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Constants.primaryColor,
        ),
        home: Login());
  }
}
