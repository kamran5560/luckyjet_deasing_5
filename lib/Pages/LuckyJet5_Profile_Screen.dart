import 'package:flutter/material.dart';
import '../Constants/Constants.dart';

class LuckyJet_5_Profile_Screen extends StatefulWidget {
  const LuckyJet_5_Profile_Screen({Key? key}) : super(key: key);

  @override
  State<LuckyJet_5_Profile_Screen> createState() =>
      _LuckyJet_5_Profile_ScreenState();
}

class _LuckyJet_5_Profile_ScreenState extends State<LuckyJet_5_Profile_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BackGroundGradient,
        padding: EdgeInsets.symmetric(vertical: 22),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, left: 22, right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color(0xffFFF4FA),
                      )),
                  Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Image.asset("images/edit.png")
                ],
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/Ruby_prof.png",
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "User Name",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
