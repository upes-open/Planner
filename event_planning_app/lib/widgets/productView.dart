import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OfferImage extends StatelessWidget {
  OfferImage({required this.image});

  String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Column(
        children: [
          Image.asset(
            image,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
