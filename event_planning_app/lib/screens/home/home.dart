import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/constants/constants.dart';
import 'package:event_planning_app/helper/helperFunctions.dart';
import 'package:event_planning_app/models/eventListModel.dart';
import 'package:event_planning_app/screens/login.dart';
import 'package:event_planning_app/screens/profile.dart';
import 'package:event_planning_app/screens/register.dart';
import 'package:event_planning_app/services/googlecalendar.dart';
import 'package:event_planning_app/services/databaseService.dart';
import 'package:event_planning_app/widgets/eventDetails.dart';
import 'package:event_planning_app/widgets/eventTile.dart';
import 'package:event_planning_app/widgets/productList.dart';

import 'package:event_planning_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:event_planning_app/services/authServices.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentIndex = 0;

  String userName = "";
  String email = "";
  // Stream? events;
  String dob = "";
  List eventNames = [];
  List eventStartDates = [];
  List eventEndDates = [];
  List eventStartTimes = [];
  List eventEndTimes = [];
  List eventTags = [];
  AuthService authService = AuthService();
  DatabaseService databaseService =
      DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingUserData();
  }

  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailFromSF().then((value) => email = value!);
    // await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
    //     .getEventDetails(FirebaseAuth.instance.currentUser!.uid)
    //     .then((value) {
    //   setState(() {
    //     eventNames = value.docs.map((e) => e["eventTitle"]).toList();
    //     eventTimes = value.docs.map((e) => e["startTime"]).toList();
    //   });
    // });
    var events = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("events")
        .get();
    setState(() {
      eventNames = events.docs;
      eventStartDates = events.docs;
      eventEndDates = events.docs;
      eventStartTimes = events.docs;
      eventEndTimes = events.docs;
      eventTags = events.docs;
    });

    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getUserData(email)
        .then((value) {
      setState(() {
        userName = value.docs[0]["fullName"];
        dob = value.docs[0]["dob"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Welcome!",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 0.0),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {
                  addEvent();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 0.0),
              child: IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                onPressed: () {
                  logOut();
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          //SearchMethod();
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Icon(
                            Icons.add_link_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(20),
                        // ),
                        child: Expanded(
                          child: TextField(
                            //controller: searchController,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Lexend",
                              fontWeight: FontWeight.w300,
                              fontSize: 17,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Product Link",
                              hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontFamily: "Lexend",
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color:
                              Color.fromRGBO(161, 117, 97, 2).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          onPressed: () {
                            eventList();
                            print(eventNames);
                            print(eventTags);
                          },
                          icon: Icon(Icons.add),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Suggestions",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: "Lexend",
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Based on your search history",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.7),
                          fontFamily: "Lexend",
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              //add image slider here
              Offerlist(
                length: 5,
                Children: Children,
              ),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Party Products",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.7),
                          fontFamily: "Lexend",
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              //add image slider here
              Offerlist(
                length: 5,
                Children: Children,
              ),
            ],
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.home,
                      color: Constants.activeColor,
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
                      // nextScreen(

                      //   context,
                      //   EventDetails(
                      //     eventName: "Makar Sankaranti",
                      //     eventDate: "Saturday, 14 Jan",
                      //     eventDetails: "Observance",
                      //     eventSubDetails:
                      //         "Makar Sankaranti is a harvest festival celebrated in India and Nepal.",
                      //     eventRegion: "Holidays in India",
                      //   ),
                      // );
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
                      nextScreen(
                        context,
                        Profile(
                          userName: userName,
                          email: email,
                          dob: dob,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.person,
                      color: Constants.inactiveColor,
                      size: 30,
                    ),
                  ),
                ],
              )),
        ));
  }

// logout dialog box function
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

// add event popup (+) icon on app bar
  addEvent() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "New Event!",
              style: TextStyle(
                fontFamily: "Lexend",
                fontSize: 25,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  //controller: _eventNameController,
                  decoration: textInputDecoration.copyWith(
                    hintText: "Event Name",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    hintText: "Event Description",
                  ),
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontFamily: "Lexend",
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      "Add",
                      style: TextStyle(
                        fontFamily: "Lexend",
                        fontSize: 18,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

// the pop up in which our events will list out with the data fetching part
  eventList() {
    return showDialog(
      context: context,
      builder: (context) {
        Size size = MediaQuery.of(context).size;
        return Dialog(
            child: Container(
          height: size.height * 0.5,
          padding: EdgeInsets.all(size.width * 0.05),
          child: Expanded(
            child: ListView.builder(
              itemCount: eventNames.length,
              itemBuilder: (context, index) {
                return EventListModel(
                  eventTitle: eventNames[index].data()['eventTitle'],
                  eventStartDate: eventStartDates[index].data()['startDate'],
                  tag: eventTags[index].data()['eventTag'],
                );
              },
            ),
          ),
        ));
      },
    );
  }
}
