import 'package:flutter/material.dart';
import '../Constants/Constants.dart';
import '../Controller/model/questions_model.dart';
import 'LuckyJet5_HomePag.dart';
import 'LuckyJet5_Live_Quiz.dart';

class LuckyJet5_Congratulations extends StatefulWidget {
  int Score;
  final Questions_model model;

  LuckyJet5_Congratulations(
      {Key? key, required this.Score, required this.model})
      : super(key: key);

  @override
  State<LuckyJet5_Congratulations> createState() =>
      _LuckyJet5_CongratulationsState();
}

class _LuckyJet5_CongratulationsState extends State<LuckyJet5_Congratulations> {
  // final controller = ConfettiController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   controller.play();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BackGroundGradient,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffFDFBFF)),
              padding:
                  EdgeInsets.only(bottom: 42, top: 50, left: 32, right: 32),
              margin:
                  EdgeInsets.only(bottom: 42, top: 200, left: 32, right: 32),
              child: Column(
                children: [
                  Text(
                    "Congratulations",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0C0A48)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You have won",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff0C0A48)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xff327FF2)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            "X${widget.Score}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffA4C4FD)),
                          ),
                        ),
                        Text(
                          "points .",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff0C0A48)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Congratulation you have complete the quiz and if you enjoy the quiz please try again, if you want to see your ranking please go to the leaderboard.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xffA1A1A1),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                top: 0,
                left: 80,
                child: Image.asset("images/award_front 1.png")),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Elevated_Button("Done", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LuckyJet_5_HomePag()));
            }, 110, 18, 14),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LuckyJet_5_Live_Quiz(
                              model: widget.model,
                            )));
              },
              child: Text(
                "play again",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFFFFFF)),
              ),
            )
          ],
        )
      ]),
    ));
  }
}
