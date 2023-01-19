import 'package:flutter/material.dart';

class EventTile extends StatefulWidget {
  String eventTitle;
  String eventTag;
  EventTile({
    Key? key,
    required this.eventTag,
    required this.eventTitle,
  }) : super(key: key);

  @override
  State<EventTile> createState() => _EventTileState();
}

class _EventTileState extends State<EventTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue,
            ),
            title: Text(
              widget.eventTitle,
              style: TextStyle(
                fontFamily: "Lexend",
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              widget.eventTag,
              style: TextStyle(
                fontFamily: "Lexend",
                fontSize: 14,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          ),
        ));
  }
}
