import 'package:event_planning_app/widgets/productView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color lightgreenshede = Color(0xFFF0FAF6);
Color lightgreenshede1 = Color(0xFFB2D9CC);
Color greenshede0 = Color(0xFF66A690);
Color greenshede1 = Color(0xFF93C9B5);
Color primarygreen = Color(0xFF1E3A34);
Color grayshade = Color(0xFF93B3AA);
Color colorAcent = Color(0xFF78C2A7);
Color cyanColor = Color(0xFF6D7E6E);

const kAnimationDuration = Duration(milliseconds: 200);

class Constants {
  static String appId = "1:294793366462:web:5b7b5503cecaf4db48c7ef";
  static String apiKey = "AIzaSyBmtbxkx8xCX5LstGxw79vkk2nevX3Kj90";
  static String messagingSenderId = "294793366462";
  static String projectId = "event-planning-application";

  static const primaryColor = Color.fromARGB(255, 161, 117, 97);
  static const primaryFontFamily = "Lexend";
  static const activeColor = Color.fromARGB(255, 161, 117, 97);
  static const inactiveColor = Color.fromARGB(120, 0, 0, 0);
}

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

// const List<Map<String, String>> categoryImages = [
//   {
//     'title': 'Prime',
//     'image': 'assets/images/icons/prime.png',
//   },
//   {
//     'title': 'Mobiles',
//     'image': 'assets/images/icons/mobiles.png',
//   },
//   {
//     'title': 'Deals',
//     'image': 'assets/images/icons/deals.jpg',
//   },
//   {
//     'title': 'Fresh',
//     'image': 'assets/images/icons/fresh.png',
//   },
//   {
//     'title': 'Fashion',
//     'image': 'assets/images/icons/fashion.jpg',
//   },
//   {
//     'title': 'miniTV',
//     'image': 'assets/images/icons/movies.png',
//   },
//   {
//     'title': 'Travel',
//     'image': 'assets/images/icons/travel.png',
//   },
//   {
//     'title': 'Electronics',
//     'image': 'assets/images/icons/Electronics.png',
//   },
//   {
//     'title': 'Home',
//     'image': 'assets/images/icons/Home.png',
//   },
//   {
//     'title': 'Beauty',
//     'image': 'assets/images/icons/beauty.png',
//   },
//   {
//     'title': 'Appliances',
//     'image': 'assets/images/icons/appliances.png',
//   },
//   {
//     'title': 'Movies',
//     'image': 'assets/images/icons/movies.jpg',
//   },
//   {
//     'title': 'Furniture',
//     'image': 'assets/images/icons/furniture.jpg',
//   },
//   {
//     'title': 'Pharmacy',
//     'image': 'assets/images/icons/pharmacy.jpg',
//   },
//   {
//     'title': 'Books, Toys',
//     'image': 'assets/images/icons/toys.jpg',
//   },
//   {
//     'title': 'Alexa',
//     'image': 'assets/images/icons/alexa.jpg',
//   },
// ];

final List<String> images = [
  'assets/images/pic1.jpg',
  'assets/images/shopping.png',
  'assets/images/shopping2.png',
  'assets/images/pic3.jpg',
  'assets/images/pic4.jpg',
];

List<Widget> Children = [
  OfferImage(image: images[0]),
  OfferImage(image: images[1]),
  OfferImage(image: images[2]),
  OfferImage(image: images[3]),
];

const List<Map<String, String>> ReccImages = [
  {
    'title': 'Lenovo IdeaPad',
    'image': 'assets/images/Offers/1 (1).jpg',
    'price': '61,490',
    'discount': '25',
  },
  {
    'title': 'Redmi 9i',
    'image': 'assets/images/Offers/1 (2).jpg',
    'price': '8,999',
    'discount': '10',
  },
  {
    'title': 'Boat Rockers 450',
    'image': 'assets/images/Offers/1 (3).jpg',
    'price': '1,299',
    'discount': '67',
  },
  {
    'title': 'Fastrack Analog Watch',
    'image': 'assets/images/Offers/1 (4).jpg',
    'price': '725',
    'discount': '9',
  },
  {
    'title': 'Men Regular TShirt',
    'image': 'assets/images/Offers/1 (5).jpg',
    'price': '369',
    'discount': '54',
  },
];
