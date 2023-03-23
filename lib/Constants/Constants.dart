import 'package:flutter/material.dart';

const BackGroundGradient = BoxDecoration(
    //

    // Gradient from https://learnui.design/tools/gradient-generator.html
    gradient: LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment(0.8, 1),
  colors: <Color>[
    Color(0xff182572),
    Color(0xff000000),
  ],
));

Widget Elevated_Button(String B_text, Function() onpress, double padding_hor,
    double padding_ver, double font_size) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: ElevatedButton(
      onPressed: onpress,
      child: Text(
        "$B_text",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: font_size,
            color: Color(0xffFFFFFF)),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffA354D7),
          padding: EdgeInsets.symmetric(
              horizontal: padding_hor, vertical: padding_ver),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    ),
  );
}

Widget customAppBar(BuildContext context, String atitle) {
  return Container(
    padding: EdgeInsets.only(top: 20, bottom: 0),
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
          '$atitle',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xffFFF4FA)),
        ),
        Text(''),
      ],
    ),
  );
}

Widget numberdBoxes(String btitle, bool isActive) {
  return Container(
    child: Container(
      width: 14,
      height: 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isActive ? Colors.white : Color(0xff9783A7),
      ),
    ),
  );
}

Widget optionButton(String btitle, bool isActive, Function() onpressed) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xff4ED2F0), //                   <--- border color
          width: 2,
        ),
        borderRadius: BorderRadius.circular(6)),
    margin: EdgeInsets.symmetric(vertical: 6),
    width: 150,
    height: 45,
    child: ElevatedButton(
      onPressed: onpressed,
      child: Text(
        "$btitle",
        textAlign: TextAlign.start,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color(0xffFFFFFF)),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? Color(0xff2AC65F) : Colors.transparent,
          // padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
    ),
  );
}

class Globals {
  //https://1quizitsagame.live/api/user.php?a=202
  static String BaseURL = "https://1quizitsagame.live/api/";
}

Widget Card_1(
  int value,
  String image,
  String name,
  String values,
) {
  return Container(
    // margin: EdgeInsets.symmetric(vertical: 1),
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "${value}",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xffE1C3F9)),
            ),
            SizedBox(
              width: 16,
            ),
            Image.asset("images/${image}.png"),
            SizedBox(
              width: 16,
            ),
            Text(
              "${name}",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xffFEDED0)),
            ),
          ],
        ),
        Text(
          "${values}",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xffFFFFFF)),
        )
      ],
    ),
  );
}

Widget Card_2(
    int value, String image, String name, String values, Color color) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 14),
    padding: EdgeInsets.symmetric(
      vertical: 4,
    ),
    // decoration:
    // BoxDecoration(borderRadius: BorderRadius.circular(6), color: color),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "${value}",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xffE1C3F9)),
          ),
        ),
        // SizedBox(
        //   width: 16,
        // ),
        Expanded(
          flex: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6), color: color),
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("images/${image}.png"),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "${name}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xffFEDED0)),
                    ),
                  ],
                ),
                Text(
                  "${values}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xffFFFFFF)),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget LeaderBoardCard(int value1, String image2, String name, String value2) {
  return Row(
    children: [
      Text(
        "${value1}",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
      ),
      SizedBox(
        width: 20,
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xff644370),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/${image2}.png"),
                    ),
                  ),
                  SizedBox(width: 25),
                  Text(
                    "$name",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 100),
              child: Text(
                "$value2",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
