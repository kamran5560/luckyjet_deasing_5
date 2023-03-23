import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import '../Constants/Constants.dart';
import '../Controller/model/questions_model.dart';
import 'LuckyJet5_Profile_Screen.dart';
import 'LuckyJet5_Leaderboard_Screen.dart';
import 'LuckyJet5_Live_Quiz.dart';

class LuckyJet_5_HomePag extends StatefulWidget {
  const LuckyJet_5_HomePag({Key? key}) : super(key: key);

  @override
  State<LuckyJet_5_HomePag> createState() => _LuckyJet_5_HomePagState();
}

class _LuckyJet_5_HomePagState extends State<LuckyJet_5_HomePag> {
  Questions_model? model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    //questions
    final String response =
        await rootBundle.loadString('images/questions.json');
    model = Questions_model.fromJson(json.decode(response));
    print(model?.questions![0].questions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BackGroundGradient,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 28),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffE9C9FF)),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LuckyJet_5_Leaderboard_Screen()));
                      },
                      child: Image.asset("images/Frame 33.png")),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LuckyJet_5_Profile_Screen()));
                      },
                      child: Image.asset(
                        "images/Ruby.png",
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "10",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFFFFFF)),
                        ),
                        Text(
                          "Total Win",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffC3CFF9)),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "1,031",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFFFFFF)),
                        ),
                        Text(
                          "Total Points",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffC3CFF9)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffF9F4FF)),
                    padding: EdgeInsets.only(
                        top: 100, bottom: 35, left: 18, right: 26),
                    margin: EdgeInsets.only(top: 100, bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Play Quiz select the right answer",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff5322BC)),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff7D7979)),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: -20,
                    child: Image.asset("images/fir_man.png"),
                  ),
                  Positioned(
                    top: 10,
                    right: 20,
                    child: Image.asset("images/purple-question.png"),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 100, horizontal: 18),
                  child: Elevated_Button("Play QUIZ", () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LuckyJet_5_Live_Quiz(model: model!),
                        ));
                  }, 22, 15, 14))
            ],
          ),
        ),
      ),
    );
  }
}
