import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naurs/models/expectation_choice.dart';
import 'package:naurs/utils/colors.dart';
import 'package:naurs/widgets/alert/alert.dart';
import 'package:naurs/widgets/button/button.dart';

class Expectation extends StatefulWidget {
  const Expectation({Key? key}) : super(key: key);

  @override
  State<Expectation> createState() => _ExpectationState();
}

class _ExpectationState extends State<Expectation> {
  String myChoice = "";
  List<ExpectationChoice> choiceList = <ExpectationChoice>[];

  @override
  void initState() {
    super.initState();
    choiceList.add(ExpectationChoice(choice: "NOT SURE", isSelected: false));
    choiceList.add(
        ExpectationChoice(choice: "Improve Music Skills", isSelected: false));
    choiceList.add(
        ExpectationChoice(choice: "Improve Dance Skills", isSelected: false));
    choiceList.add(
        ExpectationChoice(choice: "Enroll In Aerial Yoga", isSelected: false));
    choiceList.add(ExpectationChoice(
        choice: "Improve Fine Art Skills", isSelected: false));
    choiceList.add(ExpectationChoice(
        choice: "Enroll In Fitness Class", isSelected: false));
    choiceList.add(ExpectationChoice(
        choice: "Enroll In Bollywood Dance", isSelected: false));
  }

  @override
  Widget build(BuildContext context) {
    final dHeight = MediaQuery.of(context).size.height;
    final dWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarDividerColor: Colors.transparent,
          ),
          child: Scaffold(
            backgroundColor: secondary,
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 20.0),
                  child: const Text("What are your expectations & targets?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: primary)),
                ),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  for (var element in choiceList) {
                                    element.isSelected = false;
                                  }
                                  choiceList[1].isSelected = true;
                                  myChoice = choiceList[1].choice;
                                });
                              },
                              child: Container(
                                width: dWidth,
                                margin: EdgeInsets.fromLTRB(
                                    0,
                                    (dHeight / 100) * .5,
                                    (dHeight / 100) * .5,
                                    (dHeight / 100) * .5),
                                padding: EdgeInsets.symmetric(
                                    vertical: (dHeight / 100) * 1.5),
                                decoration: BoxDecoration(
                                    color: choiceList[1].isSelected
                                        ? primary
                                        : grey,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        offset: const Offset(0, 4),
                                        blurRadius: 6,
                                        spreadRadius: -3,
                                      )
                                    ]),
                                child: Text(
                                  choiceList[1].choice,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: choiceList[1].isSelected
                                          ? secondary
                                          : primary),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  for (var element in choiceList) {
                                    element.isSelected = false;
                                  }
                                  choiceList[2].isSelected = true;
                                  myChoice = choiceList[2].choice;
                                });
                              },
                              child: Container(
                                width: dWidth,
                                margin: EdgeInsets.fromLTRB(
                                    0,
                                    (dHeight / 100) * .5,
                                    (dHeight / 100) * .5,
                                    (dHeight / 100) * .5),
                                padding: EdgeInsets.symmetric(
                                    vertical: (dHeight / 100) * 1.5),
                                decoration: BoxDecoration(
                                    color: choiceList[2].isSelected
                                        ? primary
                                        : grey,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        offset: const Offset(0, 4),
                                        blurRadius: 6,
                                        spreadRadius: -3,
                                      )
                                    ]),
                                child: Text(
                                  choiceList[2].choice,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: choiceList[2].isSelected
                                          ? secondary
                                          : primary),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  for (var element in choiceList) {
                                    element.isSelected = false;
                                  }
                                  choiceList[3].isSelected = true;
                                  myChoice = choiceList[3].choice;
                                });
                              },
                              child: Container(
                                width: dWidth,
                                margin: EdgeInsets.fromLTRB(
                                    0,
                                    (dHeight / 100) * .5,
                                    (dHeight / 100) * .5,
                                    (dHeight / 100) * .5),
                                padding: EdgeInsets.symmetric(
                                    vertical: (dHeight / 100) * 5),
                                decoration: BoxDecoration(
                                    color: choiceList[3].isSelected
                                        ? primary
                                        : grey,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        offset: const Offset(0, 4),
                                        blurRadius: 6,
                                        spreadRadius: -3,
                                      )
                                    ]),
                                child: Text(
                                  choiceList[3].choice,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: choiceList[3].isSelected
                                          ? secondary
                                          : primary),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  for (var element in choiceList) {
                                    element.isSelected = false;
                                  }
                                  choiceList[0].isSelected = true;
                                  myChoice = choiceList[0].choice;
                                });
                              },
                              child: Container(
                                width: dWidth,
                                margin: EdgeInsets.fromLTRB(
                                    0,
                                    (dHeight / 100) * .5,
                                    (dHeight / 100) * .5,
                                    (dHeight / 100) * .5),
                                padding: EdgeInsets.symmetric(
                                    vertical: (dHeight / 100) * 1.5),
                                decoration: BoxDecoration(
                                    color: choiceList[0].isSelected
                                        ? primary
                                        : grey,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        offset: const Offset(0, 4),
                                        blurRadius: 6,
                                        spreadRadius: -3,
                                      )
                                    ]),
                                child: Text(
                                  choiceList[0].choice,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: choiceList[0].isSelected
                                          ? secondary
                                          : primary),
                                ),
                              ),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  for (var element in choiceList) {
                                    element.isSelected = false;
                                  }
                                  choiceList[4].isSelected = true;
                                  myChoice = choiceList[4].choice;
                                });
                              },
                              child: Container(
                                width: dWidth,
                                margin: EdgeInsets.fromLTRB(
                                    (dHeight / 100) * .5,
                                    (dHeight / 100) * .5,
                                    0,
                                    (dHeight / 100) * .5),
                                padding: EdgeInsets.symmetric(
                                    vertical: (dHeight / 100) * 8),
                                decoration: BoxDecoration(
                                    color: choiceList[4].isSelected
                                        ? primary
                                        : grey,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        offset: const Offset(0, 4),
                                        blurRadius: 6,
                                        spreadRadius: -3,
                                      )
                                    ]),
                                child: Text(
                                  choiceList[4].choice,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: choiceList[4].isSelected
                                          ? secondary
                                          : primary),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  for (var element in choiceList) {
                                    element.isSelected = false;
                                  }
                                  choiceList[5].isSelected = true;
                                  myChoice = choiceList[5].choice;
                                });
                              },
                              child: Container(
                                width: dWidth,
                                margin: EdgeInsets.fromLTRB(
                                    (dHeight / 100) * .5,
                                    (dHeight / 100) * .5,
                                    0,
                                    (dHeight / 100) * .5),
                                padding: EdgeInsets.symmetric(
                                    vertical: (dHeight / 100) * 1.5),
                                decoration: BoxDecoration(
                                    color: choiceList[5].isSelected
                                        ? primary
                                        : grey,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        offset: const Offset(0, 4),
                                        blurRadius: 6,
                                        spreadRadius: -3,
                                      )
                                    ]),
                                child: Text(
                                  choiceList[5].choice,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: choiceList[5].isSelected
                                          ? secondary
                                          : primary),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  for (var element in choiceList) {
                                    element.isSelected = false;
                                  }
                                  choiceList[6].isSelected = true;
                                  myChoice = choiceList[6].choice;
                                });
                              },
                              child: Container(
                                width: dWidth,
                                margin: EdgeInsets.fromLTRB(
                                    (dHeight / 100) * .5,
                                    (dHeight / 100) * .5,
                                    0,
                                    (dHeight / 100) * .5),
                                padding: EdgeInsets.symmetric(
                                    vertical: (dHeight / 100) * 5),
                                decoration: BoxDecoration(
                                    color: choiceList[6].isSelected
                                        ? primary
                                        : grey,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        offset: const Offset(0, 4),
                                        blurRadius: 6,
                                        spreadRadius: -3,
                                      )
                                    ]),
                                child: Text(
                                  choiceList[6].choice,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: choiceList[6].isSelected
                                          ? secondary
                                          : primary),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ],
                    )),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: (dHeight / 100) * 2),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      child: button(
                          dWidth: dWidth,
                          onPressed: () {
                            isValidated()
                                ? Navigator.pushNamed(context, "register")
                                : alert(context,
                                    type: "error",
                                    message: "Please select one option.");
                          },
                          title: "Continue",
                          color: secondary,
                          background: primary,
                          subWidget: const Icon(Icons.arrow_forward_ios_rounded,
                              color: secondary)),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  bool isValidated() => myChoice.isEmpty ? false : true;
}
