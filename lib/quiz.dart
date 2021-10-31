import 'package:flutter/material.dart';
import "./question.dart";
import "./answer.dart";

class Quiz extends StatelessWidget {
  const Quiz(
      {Key? key,
      required this.questions,
      required this.answerQuestion,
      required this.questionIndex})
      : super(key: key);

  final List<Map<String, dynamic>> questions;
  final Function answerQuestion;
  final int questionIndex;

  @override
  Widget build(BuildContext context) => Column(children: [
        Question(questionText: questions[questionIndex]['question']),
        ...(questions[questionIndex]['answers'] as List<String>)
            .map((answer) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                child: Answer(
                    onSelect: answerQuestion,
                    correctAnswer: questions[questionIndex]['correctAnswer'],
                    answer: answer)))
            .toList()
      ]);
}
