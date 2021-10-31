import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetQuiz;
  final double score;

  const Result({Key? key, required this.score, required this.resetQuiz})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(children: [
        const Text("Your Score:",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(score.toStringAsFixed(2) + "%",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
              width: 180,
              child: ElevatedButton(
                  onPressed: () => resetQuiz(),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Restart Quiz",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        Icon(Icons.arrow_forward,
                            color: Colors.white, size: 23),
                      ]))),
        )
      ]);
}
