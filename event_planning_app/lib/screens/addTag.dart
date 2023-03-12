import 'package:flutter/material.dart';

import '../services/googlecalendar.dart';

class addTag extends StatefulWidget {
  addTag({super.key});

  @override
  State<addTag> createState() => _addTagState();
}

class _addTagState extends State<addTag> {
  final tag = TextEditingController();
  String color = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    tag.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 20,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: size.width * 0.05),
                child: Text(
                  'New Tag',
                  style: TextStyle(
                    color: Colors.brown,
                    fontFamily: "Lexend",
                    fontWeight: FontWeight.w300,
                    fontSize: size.width * 0.06,
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                  padding: EdgeInsets.only(right: 10),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close_sharp, color: Colors.brown, size: 20)),
            ],
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.only(
                left: size.width * 0.05, right: size.width * 0.05),
            width: MediaQuery.of(context).size.width * 0.5,
            child: TextFormField(
              controller: tag,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Tag Name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.w300,
                  fontSize: size.width * 0.04,
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Lexend",
                fontWeight: FontWeight.w300,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.05),
                      child: Row(
                        children: [
                          Text(
                            'Select a Color',
                            style: TextStyle(
                              color: Colors.brown,
                              fontFamily: "Lexend",
                              fontWeight: FontWeight.w100,
                              fontSize: size.width * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          color = "red";
                        },
                        icon: Icon(Icons.radio_button_checked,
                            color: Colors.red, size: 15),
                      ),
                      IconButton(
                        onPressed: () {
                          color = "yellow";
                        },
                        icon: Icon(Icons.radio_button_checked,
                            color: Colors.yellow, size: 15),
                      ),
                      IconButton(
                        onPressed: () {
                          color = "blue";
                        },
                        icon: Icon(Icons.radio_button_checked,
                            color: Colors.blue, size: 15),
                      ),
                      IconButton(
                        onPressed: () {
                          color = "orange";
                        },
                        icon: Icon(Icons.radio_button_checked,
                            color: Colors.orange, size: 15),
                      ),
                      IconButton(
                        onPressed: () {
                          color = "pink";
                        },
                        icon: Icon(Icons.radio_button_checked,
                            color: Colors.pink, size: 15),
                      ),
                      IconButton(
                        onPressed: () {
                          color = "green";
                        },
                        icon: Icon(Icons.radio_button_checked,
                            color: Colors.green, size: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Lexend",
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
