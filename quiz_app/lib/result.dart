import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;

  Result(this.resultscore);

  String get resultPhrase {
    var resulttext = 'You did it!';
    if (resultscore <= 8) {
      resulttext = 'You are awesome and innocent';
    } else if (resultscore <= 12) {
      resulttext = 'Pretty likeable!';
    } else if (resultscore <= 16) {
      resulttext = 'You are .. strange';
    } else {
      resulttext = "You are so bad";
    }

    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
