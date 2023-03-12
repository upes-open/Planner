import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'package:event_planning_app/services/authServices.dart';
import 'package:event_planning_app/helper/helperFunctions.dart';
import 'package:event_planning_app/constants/constants.dart';
import 'package:event_planning_app/screens/home/home.dart';
import 'package:event_planning_app/screens/login.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isChecked = false;
  TextEditingController dateinput = TextEditingController();
  String email = "";
  String password = "";
  String fullName = "";
  String dob = "";
  AuthService authService = AuthService();

  @override
  void initState() {
    dateinput.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),*/
      backgroundColor: Colors.white,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor),
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
                          const Text(
                            "Welcome!",
                            style: TextStyle(
                              fontSize: 32,
                              fontFamily: "Lexend",
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Create an account",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Lexend",
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(100, 0, 0, 0),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          //Image.asset("assets/images/register.png"),
                          TextFormField(
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Lexend",
                            ),
                            decoration: textInputDecoration.copyWith(
                                labelText: "Full Name",
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                )),
                            onChanged: (val) {
                              setState(() {
                                fullName = val;
                              });
                            },
                            validator: (val) {
                              if (val!.isNotEmpty) {
                                return null;
                              } else {
                                return "Your name cannot be empty!!";
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            style: TextStyle(
                              fontFamily: "Lexend",
                              color: Colors.black,
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
                              color: Colors.black,
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
                            height: 15,
                          ),
                          TextField(
                            controller:
                                dateController, //editing controller of this TextField
                            decoration: InputDecoration(
                              hintText: "Enter Date of Birth",
                              hintStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Lexend",
                                color: Colors.black,
                              ),
                              prefixIcon: Icon(Icons.calendar_today),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2),
                              ),
                            ),
                            readOnly: true, // when true user cannot edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate:
                                      DateTime.now(), //get today's date
                                  firstDate: DateTime(
                                      2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);

                                setState(() {
                                  dateController.text = formattedDate;
                                  dob = dateController.text;
                                });
                              } else {
                                showSnackBar(context, Colors.red,
                                    "Date is not selected");
                              }
                            },
                          ),

                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                activeColor: Theme.of(context).primaryColor,
                                value: _isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    _isChecked = true;
                                  });
                                },
                              ),
                              Text(
                                "I agree to the Terms and Conditions",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "Lexend",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 14,
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
                                "Create Account",
                                style: TextStyle(
                                  fontFamily: "Lexend",
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: () {
                                _isChecked == true
                                    ? register()
                                    : showSnackBar(context, Colors.red,
                                        "Please agree to the terms and conditions");
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(
                                fontFamily: "Lexend",
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Login Here",
                                    style: TextStyle(
                                        fontFamily: "Lexend",
                                        fontSize: 16,
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        nextScreen(context, const Login());
                                      }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Text(
                              "OR SIGN UP WITH",
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

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(fullName, email, password, dob)
          .then((value) async {
        if (value == true) {
          await HelperFunctions.savedUserLoggedInStatus(true);
          await HelperFunctions.savedUserNameSF(fullName);
          await HelperFunctions.savedUserEmailSF(email);
          await HelperFunctions.savedUserDOB(dob);
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
