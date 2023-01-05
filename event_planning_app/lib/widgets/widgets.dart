import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(
    color: Color.fromARGB(255, 137, 44, 220),
    fontWeight: FontWeight.w300,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 137, 44, 220),
      width: 2,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 82, 5, 123),
      width: 2,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 82, 5, 123),
      width: 2,
    ),
  ),
);

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.white,
      ),
    ),
  );
}
