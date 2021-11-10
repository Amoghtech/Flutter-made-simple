import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionindex = 0;

  void answerquestions() {
    setState(() {
      questionindex = questionindex + 1;
    });
    // print('Answer chosen');
  }

  @override
  Widget build(BuildContext ctx) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App!'),
        ),
        body: Column(children: [
          Text(questions[questionindex]),
          RaisedButton(
            child: Text('Answer 1'),
            onPressed: answerquestions,
          ),
          RaisedButton(
            child: Text('Answer 2'),
            onPressed: answerquestions,
          ),
          RaisedButton(
            child: Text('Answer 3'),
            onPressed: answerquestions,
          ),
          RaisedButton(
            child: Text('Answer 4'),
            onPressed: answerquestions,
          ),
        ]),
      ),
    );
  }
}
