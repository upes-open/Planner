import 'package:flutter/material.dart';

class EventListModel extends StatefulWidget {
  String eventTitle;
  String eventStartDate;
  String tag;
  EventListModel(
      {Key? key,
      required this.eventTitle,
      required this.eventStartDate,
      required this.tag})
      : super(key: key);

  @override
  State<EventListModel> createState() => _EventListModelState();
}

class _EventListModelState extends State<EventListModel> {
  @override
  Widget build(BuildContext context) {
    bool selected = false;
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.width * 0.02),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.eventTitle}',
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.green,
                    size: size.width * 0.045,
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    '${widget.eventStartDate}',
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                '${widget.tag}',
                style: TextStyle(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
