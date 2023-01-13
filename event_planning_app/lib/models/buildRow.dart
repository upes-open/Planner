import 'package:flutter/material.dart';

class _buildRow extends StatelessWidget {
  String imageAsset;
  String name;
  String subtitle;

  _buildRow(
      {super.key,
      required this.imageAsset,
      required this.name,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Container(height: 2, color: Colors.grey[100]),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  print("Image works just fine");
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white10,
                  backgroundImage: AssetImage(imageAsset),
                ),
              ),
              SizedBox(width: 20),
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )),
              Spacer(),
              GestureDetector(
                onTap: () {
                  // calls the function to edit the event
                  print("Edit works just fine");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Image.asset(
                    'assets/icons/edit.png',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
