import 'payCont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Offerlist extends StatelessWidget {
  Offerlist({required this.length, required this.Children});
  // This is a constructor
  late List<Widget> Children;
  late int length;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          0.35, // This is the height of the container
      child: ListView.builder(
          itemBuilder: (context, index) {
            return PayCont(Child: Children[index]);
          },
          itemCount: length,
          scrollDirection: Axis.horizontal),
    );
  }
}
