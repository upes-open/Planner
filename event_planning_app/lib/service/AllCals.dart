import 'package:flutter/material.dart';
import 'package:event_planning_app/service/calender.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class WeekCalender extends StatefulWidget {
  const WeekCalender({Key? key}) : super(key: key);
  @override
  State<WeekCalender> createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calendar"),
          backgroundColor: Color(0x44000000),
          elevation: 0,
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.brown),
              child: Column(),
            ),
            ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Calender()),
                  );
                },
                leading: Icon(Icons.view_agenda, size: 26),
                title: Text("Schedule", style: TextStyle(fontSize: 20))),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeekCalender()),
                );
              },
              leading: Icon(Icons.view_week, size: 26),
              title: Text("Week", style: TextStyle(fontSize: 20)),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MonthCalender()),
                );
              },
              leading: Icon(Icons.calendar_view_month, size: 26),
              title: Text("Month", style: TextStyle(fontSize: 20)),
            )
          ],
        )),
        body: Container(
            child: SfCalendar(
          view: CalendarView.week,
        )));
  }
}

class MonthCalender extends StatefulWidget {
  const MonthCalender({Key? key}) : super(key: key);
  @override
  State<MonthCalender> createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calendar"),
          backgroundColor: Color(0x44000000),
          elevation: 0,
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.brown),
              child: Column(),
            ),
            ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Calender()),
                  );
                },
                leading: Icon(Icons.view_agenda, size: 26),
                title: Text("Schedule", style: TextStyle(fontSize: 20))),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeekCalender()),
                );
              },
              leading: Icon(Icons.view_week, size: 26),
              title: Text("Week", style: TextStyle(fontSize: 20)),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MonthCalender()),
                );
              },
              leading: Icon(Icons.calendar_view_month, size: 26),
              title: Text("Month", style: TextStyle(fontSize: 20)),
            )
          ],
        )),
        body: Container(
            child: SfCalendar(
          view: CalendarView.month,
          monthViewSettings: MonthViewSettings(showAgenda: true),
        )));
  }
}
