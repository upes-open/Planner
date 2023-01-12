import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayCont extends StatelessWidget {
  PayCont({required this.Child});
  Widget Child;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(5.0),
      width: width * 0.6,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              offset: const Offset(0.0, 0.0),
              blurRadius: 3.0,
              spreadRadius: 0.0,
              color: Colors.black)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Child,
    );
  }
}
