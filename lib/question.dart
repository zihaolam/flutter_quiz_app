import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  const Question({Key? key, required this.questionText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(questionText,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center);
  }
}
