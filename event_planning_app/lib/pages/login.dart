import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:event_planning_app/widgets/widgets.dart';

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
  //AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),*/
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Rock On!!",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 188, 111, 241),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Login to be the part of the community chat!!",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 188, 111, 241),
                        ),
                      ),
                      Image.asset("assets/images/login.png"),
                      TextFormField(
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        decoration: textInputDecoration.copyWith(
                            labelText: "Email",
                            prefixIcon: Icon(
                              Icons.email,
                              color: Theme.of(context).primaryColor,
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
                            color: Color.fromARGB(255, 255, 255, 255)),
                        obscureText: true,
                        decoration: textInputDecoration.copyWith(
                            labelText: "Password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Theme.of(context).primaryColor,
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
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Sign In",
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          onPressed: () {
                            //login();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text.rich(TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Register Here",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    //nextScreen(context, const Register());
                                  }),
                          ])),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  // login() async {
  //   if (formKey.currentState!.validate()) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     await authService
  //         .loginWithUserEmailandPassword(email, password)
  //         .then((value) async {
  //       if (value == true) {
  //         QuerySnapshot snapshot =
  //             await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
  //                 .getUserData(email);
  //         // saving value to shared preferences
  //         await HelperFunctions.savedUserLoggedInStatus(true);
  //         await HelperFunctions.savedUserNameSF(snapshot.docs[0]['fullName']);
  //         await HelperFunctions.savedUserEmailSF(email);
  //         nextScreenReplace(context, Home());
  //       } else {
  //         setState(() {
  //           showSnackBar(context, Colors.red, value);
  //           _isLoading = false;
  //         });
  //       }
  //     });
  //   }
  // }
}
