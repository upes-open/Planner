import 'package:event_planning_app/constants/constants.dart';
import 'package:event_planning_app/helper/helperFunctions.dart';
import 'package:event_planning_app/screens/home/home.dart';
import 'package:event_planning_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isSignedIn = false;
  @override
  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      setState(() {
        _isSignedIn = value!;
      });
    });
  }

  void initState() {
    super.initState();
    Timer(Duration(seconds: 6), () {
      _isSignedIn
          ? nextScreenReplace(context, Home())
          : nextScreenReplace(context, Login());
    });
    getUserLoggedInStatus();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/images/Planner.gif')),
    );
  }
}
