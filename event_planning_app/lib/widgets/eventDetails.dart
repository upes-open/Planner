import 'package:flutter/material.dart';

class EventDetails extends StatefulWidget {
  String eventName;
  String eventDate;
  String eventDetails;
  String eventSubDetails;
  String eventRegion;
  EventDetails({
    super.key,
    required this.eventName,
    required this.eventDate,
    required this.eventDetails,
    required this.eventSubDetails,
    required this.eventRegion,
  });

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.square_rounded,
                      color: Theme.of(context).primaryColor),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Text(
                        widget.eventName,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Lexend",
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.eventDate,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Lexend",
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.list_outlined,
                      color: Theme.of(context).primaryColor),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        widget.eventDetails,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Lexend",
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          widget.eventSubDetails,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Lexend",
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.calendar_today_rounded,
                      color: Theme.of(context).primaryColor),
                  SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.eventRegion,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Lexend",
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
