import 'package:flutter/material.dart';
import 'package:untitled/input_page.dart';

import 'constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResults,
      @required this.resultText,
      @required this.interpretation});
  String? bmiResults;
  String? resultText;
  String? interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'YOUR RESULTS',
                style: kTextTitle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Reusable_card(
                colour: Color(activeColor),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '$resultText',
                      style: kResultTextStyle,
                    ),
                    Text(
                      '$bmiResults',
                      style: kWeightText,
                    ),
                    Text(
                      '$interpretation',
                      style: kBodyTextStyle,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context,
                            MaterialPageRoute(builder: (context) {
                          return ResultPage();
                        }));
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            'RECALCULATE',
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
              ))
        ],
      ),
    );
  }
}
