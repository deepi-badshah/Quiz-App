import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  /// Constructor of Answer class
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Color.fromARGB(188, 23, 187, 228),
        child: Text(answerText),
        textColor: Colors.white,
        onPressed: selectHandler,
      ),
    );
  }
}
