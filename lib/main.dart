import 'package:flutter/material.dart';
import 'package:second_app/result.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<_MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'Who\'s your best friend ',
      'answers': [
        {'text': 'Smarudhi', 'score': 3},
        {'text': 'Sakshi', 'score': 7},
        {'text': 'Smita', 'score': 9},
        {'text': 'Deepu', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your nick name ',
      'answers': [
        {'text': 'Bhuchaal', 'score': 1},
        {'text': 'Chipkali', 'score': 7},
        {'text': 'Nagin', 'score': 9},
        {'text': 'Shristi', 'score': 3},
      ],
    },
  ];
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('Nomore questions! ');
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello, Im Deepanshu'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
