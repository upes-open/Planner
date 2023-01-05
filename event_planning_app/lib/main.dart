import 'package:flutter/material.dart';
import 'package:event_planning_app/service/calender.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

//void main() {
//  runApp(MyApp());
//}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home : const Calender(),
    );
  }
}
