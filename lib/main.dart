import 'package:flutter/material.dart';
import 'package:second_app/result.dart';
import './quiz.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
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
      'questionText': 'What\'s your dream car?',
      'answers': [
        {'text': 'Tesla', 'score': 3},
        {'text': 'Mahindra Jeep', 'score': 7},
        {'text': 'Maruti 800', 'score': 9},
        {'text': 'Dugati', 'score': 1},
      ],
    },
    {
      'questionText': 'Who\'s your favourite singer?',
      'answers': [
        {'text': 'Arijit Singh', 'score': 1},
        {'text': 'Darshan Raval', 'score': 7},
        {'text': 'Jubin Nautiyal', 'score': 9},
        {'text': 'B Praak', 'score': 3},
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
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello, Welcome to the Quiz'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.orange,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
        floatingActionButton: FloatingActionButton(
          onPressed: _resetQuiz,
          backgroundColor: Colors.orange,
          elevation: 20,
          child: Text(
            "Restart",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
