import "package:flutter/material.dart";

class Answer extends StatelessWidget {
  final Function onSelect;
  final String answer;
  final String correctAnswer;

  const Answer(
      {Key? key,
      required this.onSelect,
      required this.answer,
      required this.correctAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(answer),
          RawMaterialButton(
              onPressed: () => onSelect(answer),
              elevation: 2.0,
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 18,
              ),
              padding: const EdgeInsets.all(1),
              shape: const CircleBorder(),
              fillColor: Colors.blue[400])
        ],
      ));
}
