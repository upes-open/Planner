import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/helper/helperFunctions.dart';
import 'package:event_planning_app/screens/AllCals.dart';
import 'package:event_planning_app/services/databaseService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/mybusinessverifications/v1.dart';
import 'package:googleapis/streetviewpublish/v1.dart';
import 'package:googleapis/transcoder/v1.dart';
import 'package:googleapis/vault/v1.dart';
import '../services/calendarevent.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../services/googlecalendar.dart';

class addevent extends StatefulWidget {
  const addevent({Key? key}) : super(key: key);
  @override
  State<addevent> createState() => _addevent();
}

class _addevent extends State<addevent> {
  String eventTitle = "";
  bool _isAllDay = false;

  @override
  CalendarClient calendarClient = CalendarClient();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(Duration(days: 1));
  TextEditingController _eventName = TextEditingController();

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.brown),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.check,
                    color: Colors.brown,
                    size: 30,
                  ),
                  onPressed: () {
                    DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                        .saveEventDetails(
                      eventTitle,
                      startTime,
                      endTime,
                      _isAllDay,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Calender()),
                    );
                  },
                ),
              ),
            ],
            actionsIconTheme:
                IconThemeData(size: 20.0, color: Colors.black, opacity: 10.0),
          ),
          body: Container(
              child: Column(children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.08,
              child: TextField(
                controller: _eventName,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.w300,
                  fontSize: 25,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Add Title',
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontFamily: "Lexend",
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    eventTitle = value;
                  });
                },
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1.5,
              indent: 10,
              endIndent: 10,
              color: Colors.grey,
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.black.withOpacity(0.6),
                        size: 25,
                      ),
                      // Padding(padding: EdgeInsets.only(left: 20,right: 20)),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'All-Day',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      Switch(
                        activeColor: Colors.brown,
                        activeTrackColor: Colors.brown[300],
                        inactiveThumbColor: Colors.black.withOpacity(0.6),
                        inactiveTrackColor: Colors.grey.shade400,
                        splashRadius: 50.0,
                        // boolean variable value
                        value: _isAllDay,
                        // changes the state of the switch
                        onChanged: (value) => setState(() => _isAllDay = value),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40, right: 10, bottom: 5, top: 5),
                  child: TextButton(
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2019, 3, 5),
                            maxTime: DateTime(2200, 6, 7), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          setState(() {
                            this.startTime = date;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Text(
                        'Start Time',
                        style: TextStyle(
                          color: Colors.brown,
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.w100,
                          fontSize: 20,
                        ),
                      )),
                ),
                Text(
                  '$startTime',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Lexend",
                    fontWeight: FontWeight.w100,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40, right: 10, top: 5, bottom: 5),
                  child: TextButton(
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2019, 3, 5),
                            maxTime: DateTime(2200, 6, 7), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          setState(() {
                            this.endTime = date;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Text(
                        'End Time',
                        style: TextStyle(
                          color: Colors.brown,
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.w100,
                          fontSize: 20,
                        ),
                      )),
                ),
                Text(
                  '$endTime',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Lexend",
                    fontWeight: FontWeight.w100,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ])),
        ));
  }
}
