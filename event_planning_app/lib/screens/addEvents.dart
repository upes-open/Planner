import 'package:event_planning_app/services/databaseService.dart';
import 'package:event_planning_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEvents extends StatefulWidget {
  const AddEvents({Key? key}) : super(key: key);

  @override
  State<AddEvents> createState() => _AddEventsState();
}

class _AddEventsState extends State<AddEvents> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  String eventStartDate = "";
  String eventStartTime = "";
  String eventEndDate = "";
  String eventEndTime = "";
  String eventTitle = "";
  String eventTag = "";
  String eventDescription = "";
  bool addDesc = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(
                "Add Events",
                style: TextStyle(
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Lexend',
                ),
              ),
              Divider(
                endIndent: size.width * 0.2,
                color: Colors.black,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  decoration: textInputDecoration.copyWith(
                    hintText: "Event Title",
                    label: Text("Event Title"),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 1,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      eventTitle = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text.rich(
                TextSpan(
                  text: "+ Add Description",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Lexend",
                    fontSize: size.width * 0.04,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        addDesc = !addDesc;
                      });
                    },
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Visibility(
                visible: addDesc == true,
                child: Container(
                  width: size.width * 0.8,
                  child: TextFormField(
                    decoration: textInputDecoration.copyWith(
                      hintText: "Event Description",
                      label: Text("Event Description"),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                          width: 1,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        eventDescription = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.all(size.width * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\t\tStart Date-Time',
                      style: TextStyle(
                        fontFamily: 'Lexend',
                        fontSize: size.width * 0.04,
                        color: Colors.black,
                      ),
                    ),
                    Divider(
                      indent: size.width * 0.02,
                      endIndent: size.width * 0.2,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: TextField(
                        controller:
                            startDateController, //editing controller of this TextField
                        decoration: InputDecoration(
                          label: Text("Event Date"),
                          labelStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Lexend",
                            color: Colors.black,
                          ),
                          hintText: "Event Date",
                          hintStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Lexend",
                            color: Colors.black,
                          ),
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: Theme.of(context).primaryColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                        ),
                        readOnly: true, // when true user cannot edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);

                            setState(() {
                              startDateController.text = formattedDate;
                              eventStartDate = startDateController.text;
                            });
                          } else {
                            showSnackBar(
                                context, Colors.red, "Date is not selected");
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: TextField(
                        controller:
                            startTimeController, //editing controller of this TextField
                        decoration: InputDecoration(
                          label: Text("Event Time"),
                          labelStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Lexend",
                            color: Colors.black,
                          ),
                          hintText: "Event Time",
                          hintStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Lexend",
                            color: Colors.black,
                          ),
                          prefixIcon: Icon(Icons.timer,
                              color: Theme.of(context).primaryColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                        ),
                        readOnly: true, // when true user cannot edit text
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (pickedTime != null) {
                            String formattedTime =
                                pickedTime.format(context).toString();

                            setState(() {
                              startTimeController.text = formattedTime;
                              eventStartTime = startTimeController.text;
                            });
                          } else {
                            showSnackBar(
                                context, Colors.red, "Time is not selected");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.all(size.width * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\t\tEnd Date-Time',
                      style: TextStyle(
                        fontFamily: 'Lexend',
                        fontSize: size.width * 0.04,
                        color: Colors.black,
                      ),
                    ),
                    Divider(
                      indent: size.width * 0.02,
                      endIndent: size.width * 0.2,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: TextField(
                        controller:
                            endDateController, //editing controller of this TextField
                        decoration: InputDecoration(
                          label: Text("Event Date"),
                          labelStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Lexend",
                            color: Colors.black,
                          ),
                          hintText: "Event Date",
                          hintStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Lexend",
                            color: Colors.black,
                          ),
                          prefixIcon: Icon(Icons.calendar_today,
                              color: Theme.of(context).primaryColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                        ),
                        readOnly: true, // when true user cannot edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);

                            setState(() {
                              endDateController.text = formattedDate;
                              eventEndDate = endDateController.text;
                            });
                          } else {
                            showSnackBar(
                                context, Colors.red, "Date is not selected");
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: TextField(
                        controller:
                            endTimeController, //editing controller of this TextField
                        decoration: InputDecoration(
                          label: Text("Event Time"),
                          labelStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Lexend",
                            color: Colors.black,
                          ),
                          hintText: "Event Time",
                          hintStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Lexend",
                            color: Colors.black,
                          ),
                          prefixIcon: Icon(Icons.timer,
                              color: Theme.of(context).primaryColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                        ),
                        readOnly: true, // when true user cannot edit text
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (pickedTime != null) {
                            String formattedTime =
                                pickedTime.format(context).toString();

                            setState(() {
                              endTimeController.text = formattedTime;
                              eventEndTime = endTimeController.text;
                            });
                          } else {
                            showSnackBar(
                                context, Colors.red, "Time is not selected");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              DropdownButtonFormField(
                  borderRadius: BorderRadius.circular(7),
                  menuMaxHeight: size.height * 0.3,
                  itemHeight: size.height * 0.06,
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Lexend",
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Event Tag",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(17)),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(17)),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: size.width * 0.02,
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text("Birthday"),
                          ],
                        ),
                        value: "Birthday"),
                    DropdownMenuItem(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: size.width * 0.02,
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text("Meeting"),
                          ],
                        ),
                        value: "Meeting"),
                    DropdownMenuItem(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: size.width * 0.02,
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text("Party"),
                          ],
                        ),
                        value: "Party"),
                    DropdownMenuItem(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.yellow,
                              radius: size.width * 0.02,
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text("Work"),
                          ],
                        ),
                        value: "Work"),
                  ],
                  onChanged: (value) {
                    setState(() {
                      eventTag = value.toString();
                    });
                  }),
              SizedBox(
                height: size.height * 0.02,
              ),
              ElevatedButton(
                onPressed: () {
                  DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                      .saveEventDetails(
                          eventTitle,
                          eventDescription,
                          eventStartDate,
                          eventStartTime,
                          eventEndDate,
                          eventEndTime,
                          eventTag);
                  Navigator.pop(context);
                  showSnackBar(
                      context, Colors.green, 'Event Saved Successfully');
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lexend',
                    fontSize: size.width * 0.05,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
