import 'package:event_planning_app/screens/addEvents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:googleapis/calendar/v3.dart' as googleAPI;
import 'package:http/io_client.dart';
import 'package:http/http.dart';
import '../screens/AllCals.dart';
import '../screens/addTag.dart';

class GoogleAPIClient extends IOClient {
  Map<String, String> _headers;

  GoogleAPIClient(this._headers) : super();

  @override
  Future<IOStreamedResponse> send(BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<Response> head(url, {Map<String, String>? headers}) =>
      super.head(url, headers: headers!..addAll(_headers));
}

class GoogleDataSource extends CalendarDataSource {
  GoogleDataSource({List<googleAPI.Event>? events}) {
    this.appointments = events;
  }

  @override
  DateTime getStartTime(int index) {
    final googleAPI.Event event = appointments![index];
    return event.start?.date ?? event.start!.dateTime!.toLocal();
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].start.date != null;
  }

  @override
  DateTime getEndTime(int index) {
    final googleAPI.Event event = appointments![index];
    return event.endTimeUnspecified != null
        ? (event.start?.date ?? event.start!.dateTime!.toLocal())
        : (event.end!.date != null
            ? event.end!.date!.add(Duration(days: -1))
            : event.end!.dateTime!.toLocal());
  }

  @override
  String getLocation(int index) {
    return appointments![index].location;
  }

  @override
  String getNotes(int index) {
    return appointments![index].description;
  }

  @override
  String? GetSubject(int index) {
    final googleAPI.Event event = appointments![index];
    return event.summary == null || event.summary!.isEmpty
        ? 'No Title'
        : event.summary;
  }
}

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);
  @override
  State<Calender> createState() => _CalendarState();
}

class _CalendarState extends State<Calender> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        '1022372540103-76f0kqq3fpo1j83lsrc9hp1vrin8gb63.apps.googleusercontent.com',
    scopes: <String>[
      googleAPI.CalendarApi.calendarScope,
    ],
  );

  Future<List<googleAPI.Event>> getGoogleEventsData() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleAPIClient? httpClient =
        GoogleAPIClient(await googleUser!.authHeaders);
    final googleAPI.CalendarApi calendarAPI =
        googleAPI.CalendarApi(httpClient!);
    final googleAPI.Events calEvents = await calendarAPI.events.list(
      "primary",
    );
    final List<googleAPI.Event> appointments = <googleAPI.Event>[];
    if (calEvents != null && calEvents.items != null) {
      for (int i = 0; i < calEvents.items!.length; i++) {
        final googleAPI.Event event = calEvents.items![i];
        if (event.start == null) {
          continue;
        }
        appointments.add(event);
      }
    }
    return appointments;
  }

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
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 121, 85, 72)),
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
            child: FutureBuilder(
                future: getGoogleEventsData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Container(
                      child: Stack(
                    children: [
                      Container(
                        child: SfCalendar(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            view: CalendarView.schedule,
                            dataSource: GoogleDataSource(events: snapshot.data),
                            scheduleViewSettings: ScheduleViewSettings(
                                appointmentItemHeight: 70,
                                monthHeaderSettings: MonthHeaderSettings(
                                  backgroundColor:
                                      Color.fromARGB(255, 121, 85, 72),
                                ))),
                      ),
                      snapshot.data != null
                          ? Container()
                          : Center(
                              child: CircularProgressIndicator(),
                            )
                    ],
                  ));
                })),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          children: [
            SpeedDialChild(
              backgroundColor: Colors.brown,
              child: Icon(Icons.task, color: Colors.white),
              label: 'Event',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddEvents()),
                );
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
                  barrierDismissible: false,
                );
              },
            )
          ],
        ));
  }
}
