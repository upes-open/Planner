import 'package:flutter/material.dart';
import 'package:event_planning_app/models/onBoardModel.dart';
import 'package:event_planning_app/constants/constants.dart';

class OnboardScreen extends StatefulWidget {
  OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;

  List<AllinOnboardModel> allinonboardlist = [
    AllinOnboardModel(
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Prepard by exparts"),
    AllinOnboardModel(
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Delivery to your home"),
    AllinOnboardModel(
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Enjoy with everyone"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Food Express",
          style: TextStyle(color: primarygreen),
        ),
        backgroundColor: lightgreenshede,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: allinonboardlist.length,
              itemBuilder: (context, index) {
                return PageBuilderWidget(
                  title: allinonboardlist[index].titlestr,
                  description: allinonboardlist[index].description,
                );
              }),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.3,
            left: MediaQuery.of(context).size.width * 0.44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                allinonboardlist.length,
                (index) => buildDot(index: index),
              ),
            ),
          ),
          currentIndex < allinonboardlist.length - 1
              ? Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Previous",
                          style: TextStyle(fontSize: 18, color: primarygreen),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: lightgreenshede1,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0))),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Next",
                          style: TextStyle(fontSize: 18, color: primarygreen),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: lightgreenshede1,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0))),
                        ),
                      )
                    ],
                  ),
                )
              : Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.2,
                  left: MediaQuery.of(context).size.width * 0.33,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Get Started",
                      style: TextStyle(fontSize: 18, color: primarygreen),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: lightgreenshede1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? primarygreen : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;

  PageBuilderWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          //Tite Text
          Text(title,
              style: TextStyle(
                  color: primarygreen,
                  fontSize: 24,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 20,
          ),
          //discription
          Text(description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: primarygreen,
                fontSize: 14,
              ))
        ],
      ),
    );
  }
}
