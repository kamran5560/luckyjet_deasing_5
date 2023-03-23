import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../Constants/Constants.dart';
import '../Controller/model/questions_model.dart';
import 'LuckyJet5_Congratulations.dart';

class LuckyJet_5_Live_Quiz extends StatefulWidget {
  final Questions_model model;

  const LuckyJet_5_Live_Quiz({Key? key, required this.model}) : super(key: key);

  @override
  State<LuckyJet_5_Live_Quiz> createState() => _LuckyJet_5_Live_QuizState();
}

class _LuckyJet_5_Live_QuizState extends State<LuckyJet_5_Live_Quiz> {
  int index = 0;
  int Score = 0;
  bool option1 = false;
  bool option2 = false;
  bool option3 = false;
  bool option4 = false;
  ItemScrollController _scrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: BackGroundGradient,
            padding: EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: customAppBar(context, 'Live Quiz'),
                ),
                Container(
                  height: 4,
                  child: ScrollablePositionedList.builder(
                    itemScrollController: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.model.questions?.length)!,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: numberdBoxes(
                            "${index + 1}", this.index == index ? true : false),
                      );
                    },
                  ),
                  padding: EdgeInsets.only(left: 22, right: 22),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(
                          0xff4ED2F0), //                   <--- border color
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 32, horizontal: 26),
                  child: Center(
                    child: Text(
                      '${widget.model.questions?[index].questions}?',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Color(0xffFFFFFF)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 22, bottom: 72),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "4/5",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xffFFFFFF)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      optionButton(
                        '${widget.model.questions?[index].incorrectAnswer?[0]}',
                        option1,
                        () {
                          print("option 1");
                          if (option1) {
                            print("true");
                            option1 = false;
                          } else {
                            print("false");
                            option1 = true;
                            option2 = false;
                            option3 = false;
                            option4 = false;
                          }
                          setState(() {});
                        },
                      ),
                      optionButton(
                        '${widget.model.questions?[index].incorrectAnswer?[1]}',
                        option2,
                        () {
                          if (option2) {
                            option2 = false;
                          } else {
                            option2 = true;
                            option1 = false;
                            option3 = false;
                            option4 = false;
                          }
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        optionButton(
                          '${widget.model.questions?[index].incorrectAnswer?[2]}',
                          option3,
                          () {
                            if (option3) {
                              option3 = false;
                            } else {
                              option3 = true;
                              option1 = false;
                              option2 = false;
                              option4 = false;
                            }
                            setState(() {});
                          },
                        ),
                        optionButton(
                          '${widget.model.questions?[index].incorrectAnswer?[3]}',
                          option4,
                          () {
                            if (option4) {
                              option4 = false;
                            } else {
                              option4 = true;
                              option1 = false;
                              option2 = false;
                              option3 = false;
                            }
                            setState(() {});
                          },
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 82),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Elevated_Button('Next', () {
                        if (!option1 && !option2 && !option3 && !option4) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please Select an Option"
                                  "")));
                        } else {
                          if ((widget.model.questions?.length)! - 1 > index) {
                            // Score Update kaw
                            if (option1) {
                              if (widget.model.questions?[index]
                                      .incorrectAnswer?[0] ==
                                  widget
                                      .model.questions?[index].correctAnswer) {
                                print("Correct Answer 1");
                                Score++;
                              }
                            } else if (option2) {
                              if (widget.model.questions?[index]
                                      .incorrectAnswer?[1] ==
                                  widget
                                      .model.questions?[index].correctAnswer) {
                                print("Correct Answer 2");
                                Score++;
                              }
                            } else if (option3) {
                              if (widget.model.questions?[index]
                                      .incorrectAnswer?[2] ==
                                  widget
                                      .model.questions?[index].correctAnswer) {
                                print("Correct Answer 3");
                                Score++;
                              }
                            } else if (option4) {
                              if (widget.model.questions?[index]
                                      .incorrectAnswer?[3] ==
                                  widget
                                      .model.questions?[index].correctAnswer) {
                                print("Correct Answer 4");
                                Score++;
                              }
                            }
                            index++;
                            option1 = false;
                            option2 = false;
                            option3 = false;
                            option4 = false;
                            _scrollController.scrollTo(
                                index: index, duration: Duration(seconds: 1));
                            setState(() {});
                          } else {
                            //result page
                            print(Score);
                            setScore();
                          }
                        }
                      }, 130, 15, 14),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  setScore() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('score', Score).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LuckyJet5_Congratulations(
              Score: Score,
              model: widget.model,
            ),
          ));
    });
  }
}
