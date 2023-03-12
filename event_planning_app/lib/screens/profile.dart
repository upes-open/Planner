import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/screens/Login.dart';
//import 'package:event_planning_app/screens/editProfile.dart';
import 'package:event_planning_app/screens/home/home.dart';
import 'package:event_planning_app/services/authServices.dart';
import 'package:event_planning_app/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../services/googlecalendar.dart';

class Profile extends StatefulWidget {
  String userName;
  String email;
  String dob;
  Profile(
      {super.key,
      required this.userName,
      required this.email,
      required this.dob});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        title: const Text(
          "My Profile",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontFamily: "Lexend"),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: () {
                logOut();
              },
              child: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: 30),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage("assets/icons/index.png"),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(
                height: 54,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Full Name",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 8),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 234, 236, 240),
                        blurRadius: 0,
                        offset: Offset(0, 1),
                      ),
                    ]),
                    child: Text(
                      widget.userName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Email ID",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 8),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 234, 236, 240),
                        blurRadius: 0,
                        offset: Offset(0, 1),
                      ),
                    ]),
                    child: Text(
                      widget.email,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Date Of Birth",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 10, 0, 2),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.04,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 234, 236, 240),
                        blurRadius: 0,
                        offset: Offset(0, 1),
                      ),
                    ]),
                    child: Text(
                      widget.dob,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.04,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: GestureDetector(
                  onTap: () {
                    //nextScreen(context, EditProfile());
                  },
                  child: Center(
                    child: Text("Edit Profile",
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Lexend",
                          color: Colors.white,
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.2,
                vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.15),
                  blurRadius: 30,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    nextScreen(context, Home());
                  },
                  icon: Icon(
                    Icons.home,
                    color: Constants.inactiveColor,
                    size: 30,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Calender()),
                    );
                  },
                  icon: Icon(
                    Icons.calendar_month,
                    size: 30,
                    color: Constants.inactiveColor,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    // nextScreen(
                    //   context,
                    //   Profile(userName: userName, email: email),
                    // );
                  },
                  icon: Icon(
                    Icons.person,
                    color: Constants.activeColor,
                    size: 30,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  logOut() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 238, 182, 157),
            title: const Text(
              "LogOut",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Lexend",
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text(
              "Are you sure you want to logout?",
              style: TextStyle(color: Colors.black, fontFamily: "Lexend"),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              IconButton(
                onPressed: () async {
                  await authService.signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const Login()),
                      (route) => false);
                },
                icon: const Icon(
                  Icons.done,
                  color: Color.fromARGB(255, 2, 128, 54),
                ),
              ),
            ],
          );
        });
  }
}
