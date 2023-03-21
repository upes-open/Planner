import 'package:flutter/material.dart';

import '../services/googlecalendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'addTag.dart';

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
                    MaterialPageRoute(builder: (context) => ScheduleCalender()),
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
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          children: [
            SpeedDialChild(
              backgroundColor: Colors.brown,
              child: Icon(Icons.task, color: Colors.white),
              label: 'Event',
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => addevent()),
                // );
              },
            ),
            SpeedDialChild(
              backgroundColor: Colors.brown,
              child: Icon(Icons.pin_drop_rounded, color: Colors.white),
              label: 'Tag',
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => addTag(),
                    barrierDismissible: false);
              },
            )
          ],
        ));
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
                    MaterialPageRoute(builder: (context) => ScheduleCalender()),
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
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          children: [
            SpeedDialChild(
              backgroundColor: Colors.brown,
              child: Icon(Icons.task, color: Colors.white),
              label: 'Event',
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => addevent()),
                // );
              },
            ),
            SpeedDialChild(
                backgroundColor: Colors.brown,
                child: Icon(Icons.pin_drop_rounded, color: Colors.white),
                label: 'Tag',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => addTag(),
                      barrierDismissible: false);
                })
          ],
        ));
  }
}

class ScheduleCalender extends StatefulWidget {
  const ScheduleCalender({Key? key}) : super(key: key);
  @override
  State<ScheduleCalender> createState() => _ScheduleCalendarState();
}

class _ScheduleCalendarState extends State<ScheduleCalender> {
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
                    MaterialPageRoute(builder: (context) => ScheduleCalender()),
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
              view: CalendarView.schedule,
              scheduleViewSettings: ScheduleViewSettings(
                  appointmentItemHeight: 70,
                  monthHeaderSettings: MonthHeaderSettings(
                    backgroundColor: Color.fromARGB(255, 121, 85, 72),
                  ))),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          children: [
            SpeedDialChild(
              backgroundColor: Colors.brown,
              child: Icon(Icons.task, color: Colors.white),
              label: 'Event',
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => addevent()),
                // );
              },
            ),
            SpeedDialChild(
                backgroundColor: Colors.brown,
                child: Icon(Icons.pin_drop_rounded, color: Colors.white),
                label: 'Tag',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => addTag(),
                      barrierDismissible: false);
                })
          ],
        ));
  }
}
