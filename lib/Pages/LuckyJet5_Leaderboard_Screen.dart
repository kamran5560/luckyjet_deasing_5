import 'package:flutter/material.dart';
import '../Constants/Constants.dart';

class LuckyJet_5_Leaderboard_Screen extends StatefulWidget {
  const LuckyJet_5_Leaderboard_Screen({Key? key}) : super(key: key);

  @override
  State<LuckyJet_5_Leaderboard_Screen> createState() =>
      _LuckyJet_5_Leaderboard_ScreenState();
}

class _LuckyJet_5_Leaderboard_ScreenState
    extends State<LuckyJet_5_Leaderboard_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BackGroundGradient,
          padding: EdgeInsets.symmetric(horizontal: 30.5, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xffD6E4FF),
                          )),
                      Text(
                        "Leaderboard",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffD6E4FF)),
                      ),
                      Text(""),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF54D5B6).withOpacity(0.3),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      padding: EdgeInsets.only(bottom: 90),
                      child: Column(
                        children: [
                          Image.asset("images/Ruby_1.png"),
                          SizedBox(
                            height: 16,
                          ),
                          Text("Name",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white))
                        ],
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xff54BED5).withOpacity(0.2),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        padding: EdgeInsets.only(bottom: 40),
                        child: Column(
                          children: [
                            Image.asset("images/Conan_2.png"),
                            SizedBox(
                              height: 22,
                            ),
                            Text(
                              "Name",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        )),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff54D5B6).withOpacity(0.2),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      padding: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Image.asset("images/Hansel_3.png"),
                          SizedBox(
                            height: 16,
                          ),
                          Text("Name",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white))
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 52),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        LeaderBoardCard(01, 'Ruby', 'Name', "2019 pts."),
                        LeaderBoardCard(02, 'Ruby', 'Name', "2019 pts."),
                        LeaderBoardCard(03, 'Ruby', 'Name', "2019 pts."),
                        LeaderBoardCard(04, 'Ruby', 'Name', "2019 pts."),
                        LeaderBoardCard(05, 'Ruby', 'Name', "2019 pts."),
                        LeaderBoardCard(06, 'Ruby', 'Name', "2019 pts."),
                        LeaderBoardCard(07, 'Ruby', 'Name', "2019 pts."),
                        LeaderBoardCard(08, 'Ruby', 'Name', "2019 pts."),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
