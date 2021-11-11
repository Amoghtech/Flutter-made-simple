import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final Function answerquestions;
  final List<Map<String, Object>> questions;
  final int questionindex;

  Quiz(
      {@required this.answerquestions,
      @required this.questions,
      @required this.questionindex});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[questionindex]['questionText'].toString()),
      ...(questions[questionindex]['answers'] as List<Map<String, Object>>)
          .map((answers) {
        return Answer(() => answerquestions(answers['score']),
            answers['text'].toString());
      }).toList()
    ]);
  }
}
