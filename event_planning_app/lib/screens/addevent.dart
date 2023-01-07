import 'dart:html';
import 'package:flutter/material.dart';
import 'package:googleapis/mybusinessverifications/v1.dart';
import 'package:googleapis/streetviewpublish/v1.dart';
import '../service/calendarevent.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class addevent extends StatefulWidget {
  const addevent({Key? key}) : super(key: key);
  @override
  State<addevent> createState() => _addevent();
}

class _addevent extends State<addevent> {
  @override
  CalendarClient calendarClient = CalendarClient();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(Duration(days: 1));
  TextEditingController _eventName = TextEditingController();

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.brown),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          FloatingActionButton.extended(
            label: Text('Save'),
            backgroundColor: Colors.brown,
            icon: Icon(Icons.check),
            onPressed: () {
              calendarClient.insert(
                _eventName.text,
                startTime,
                endTime,
              );
            },
          ),
        ],
        actionsIconTheme:
            IconThemeData(size: 30.0, color: Colors.black, opacity: 10.0),
      ),
      body: Container(
          child: Column(children: <Widget>[
        Container(
          child: TextField(
            controller: _eventName,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Add Title',
            ),
            style: TextStyle(fontSize: 40),
          ),
        ),
        Row(
          children: <Widget>[
            TextButton(
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
                  'Event Start Time',
                  style: TextStyle(color: Colors.brown, fontSize: 30),
                )),
            Text('$startTime',style: TextStyle(fontSize: 30)),
          ],
        ),
        Row(
          children: <Widget>[
            TextButton(
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
                  'Event End Time',
                  style: TextStyle(color: Colors.brown,fontSize: 30),
                )),
            Text('$endTime',style: TextStyle(fontSize: 30)),
          ],
        ),
      ])),
    ));
  }
}
