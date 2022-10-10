import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function
      resetHandler; //we can use VoidCallback instead of keyword Function
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are Amazing ';
    } else if (resultScore <= 12) {
      resultText = 'Literally, A great choice!!';
    } else if (resultScore <= 16) {
      resultText = 'Pretty Awesome!!';
    } else {
      resultText = 'Are you crazy..!!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text('Restart Quiz!'),
            onPressed: resetHandler,
            style: TextButton.styleFrom(foregroundColor: Colors.orange),
          )
        ],
      ),
    );
  }
}
