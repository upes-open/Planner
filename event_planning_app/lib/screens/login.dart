import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:event_planning_app/widgets/widgets.dart';
import 'package:event_planning_app/constants/constants.dart';
import 'package:event_planning_app/services/authServices.dart';
import 'package:event_planning_app/services/databaseService.dart';
import 'package:event_planning_app/helper/helperFunctions.dart';
import 'package:event_planning_app/screens/home/home.dart';
import 'package:event_planning_app/screens/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool _isLoading = false;
  bool _isGoogleSignedIn = false;
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),*/
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Image(
                    image: AssetImage("assets/images/login.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Image.asset(
                          //   "assets/images/login.png",
                          // ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            "Hello!",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: "Lexend",
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Welcome Back",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Lexend",
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(100, 0, 0, 0),
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          TextFormField(
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: "Lexend",
                            ),
                            decoration: textInputDecoration.copyWith(
                                labelText: "Email",
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                )),
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                            validator: (val) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val!)
                                  ? null
                                  : "Please provide a valid email";
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: "Lexend",
                            ),
                            obscureText: true,
                            decoration: textInputDecoration.copyWith(
                                labelText: "Password",
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                )),
                            validator: (val) {
                              if (val!.length < 6) {
                                return "Password must be at least 6 characters";
                              } else {
                                return null;
                              }
                            },
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                    fontFamily: "Lexend",
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              onPressed: () {
                                login();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lexend",
                                fontSize: 14,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Register Here",
                                    style: TextStyle(
                                        fontFamily: "Lexend",
                                        fontSize: 16,
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        nextScreen(context, const Register());
                                      }),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Text(
                              "OR CONTINUE WITH",
                              style: TextStyle(
                                  fontFamily: "Lexend",
                                  fontSize: 18,
                                  color: Color.fromARGB(120, 0, 0, 0)),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 88),
                                  child: GestureDetector(
                                    onTap: () async {
                                      // await authService.signInWithGoogle();
                                      // setState(() {
                                      //   _isGoogleSignedIn = true;
                                      // });
                                      // nextScreen(context, const Home());
                                    },
                                    child: Image.asset(
                                      "assets/icons/google.png",
                                      width: MediaQuery.of(context).size.width *
                                          0.08,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 32,
                                ),
                                GestureDetector(
                                  child: Image.asset(
                                    "assets/icons/facebook.png",
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                ),
                                const SizedBox(
                                  width: 32,
                                ),
                                GestureDetector(
                                  child: Image.asset(
                                    "assets/icons/apple.png",
                                    width: MediaQuery.of(context).size.width *
                                        0.08,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .loginWithUserEmailandPassword(email, password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .getUserData(email);
          // saving value to shared preferences
          await HelperFunctions.savedUserLoggedInStatus(true);
          await HelperFunctions.savedUserNameSF(snapshot.docs[0]['fullName']);
          await HelperFunctions.savedUserEmailSF(email);
          nextScreenReplace(context, Home());
        } else {
          setState(() {
            showSnackBar(context, Colors.red, value);
            _isLoading = false;
          });
        }
      });
    }
  }
}
