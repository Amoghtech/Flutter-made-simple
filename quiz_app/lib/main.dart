//Packages
import 'package:flutter/material.dart';

//My Imports
import './question.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionindex = 0;

  void _answerquestions() {
    setState(() {
      _questionindex = _questionindex + 1;
    });
    // print('Answer chosen');
  }

  @override
  Widget build(BuildContext ctx) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'WHite']
      },
      {
        'questionText': 'What\'s your favorite animal',
        'answers': ['Rabbit', 'Elephant', 'Lion', 'Snake']
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App!'),
        ),
        body: Column(children: [
          Question("questions[_questionindex]['questionText']"),
          ...(questions[_questionindex]['answers'] as List<String>)
              .map((answers) {
            return Answer(_answerquestions, answers);
          }).toList()
        ]),
      ),
    );
  }
}
