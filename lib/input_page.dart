import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/calculatorBrain.dart';

import 'constants.dart';
import 'customed_column.dart';
import 'results_page.dart';

//VARIABLES SECTION
const bottomContainerHeight = 80.0;
const activeColor = 0xFF1D1E33;
const inActiveColor = 0xFF111328;
enum Gender {
  male,
  female,
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender? genderSelected;
  double activeHeight = 180.0;
  int activeWeight = 60;
  int age = 18;

  // int maleCardColor = inActiveColor;
  // int femaleCardColor = inActiveColor;
  // void changeColor(Gender gender) {
  //   if (Gender.male== gender) {
  //     if (maleCardColor == inActiveColor) {
  //       maleCardColor = activeColor;
  //       femaleCardColor = inActiveColor;
  //     }
  //   }
  //   if (Gender.female== gender) {
  //     if (femaleCardColor == inActiveColor) {
  //       femaleCardColor = activeColor;
  //       maleCardColor = inActiveColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'BMI CALCULATOR',
        )),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    genderSelected = Gender.male;
                  });
                },
                child: Reusable_card(
                  colour: Color(
                    genderSelected == Gender.male ? activeColor : inActiveColor,
                  ),
                  cardChild: ColumnCustom(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          genderSelected = Gender.female;
                        });
                      },
                      child: Reusable_card(
                        colour: Color(
                          genderSelected == Gender.female
                              ? activeColor
                              : inActiveColor,
                        ),
                        cardChild: ColumnCustom(
                          icon: FontAwesomeIcons.venus,
                          text: 'FEMALE',
                        ),
                      ))),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: Reusable_card(
                      colour: Color(activeColor),
                      cardChild: Column(
                        children: [
                          Text(
                            'HEIGHT',
                            style: kTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                activeHeight.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'cm',
                              ),
                            ],
                          ),
                          Slider(
                            value: activeHeight,
                            min: 100.0,
                            max: 230.0,
                            activeColor: Colors.pink,
                            inactiveColor: Colors.white70,
                            onChanged: (double newValue) {
                              setState(() {
                                activeHeight = newValue.roundToDouble();
                              });
                            },
                          )
                        ],
                      )))
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Reusable_card(
                  colour: Color(activeColor),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kTextStyle,
                      ),
                      Text(
                        activeWeight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Color(0xff4C4F5E),
                            onPressed: () {
                              setState(() {
                                activeWeight--;
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            backgroundColor: Color(0xff4C4F5E),
                            onPressed: () {
                              setState(() {
                                activeWeight++;
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Reusable_card(
                  colour: Color(activeColor),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Color(0xff4C4F5E),
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            backgroundColor: Color(0xff4C4F5E),
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
          GestureDetector(
            onTap: () {
              Calculator calc = Calculator(
                  height: activeHeight.toInt(), weight: activeWeight);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(
                  bmiResults: calc.calculateBmi(),
                  resultText: calc.getResults(),
                  interpretation: calc.getInterpritation(),
                );
              }));
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: kNumberTextStyle,
                ),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
              padding: EdgeInsets.only(bottom: 20.0),
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icony});
  final IconData? icony;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        elevation: 6.0,
        constraints: BoxConstraints(
          minWidth: 56.0,
          minHeight: 56.0,
        ),
        shape: CircleBorder(),
        fillColor: Color(0xff4C4F5E),
        child: Icon(
          icony,
        ),
        onPressed: () {});
  }
}

class Reusable_card extends StatelessWidget {
  Reusable_card({
    this.colour,
    required this.cardChild,
  });
  final Color? colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
