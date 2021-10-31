import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final _questions = [
    {
      "question": "1. What is the programming language used by Flutter?",
      "answers": ["Python", "Objective C", "Dart"],
      "correctAnswer": "Dart"
    },
    {
      "question": "2. What is 5 to the power of 5?",
      "answers": ["125", "625", "3125"],
      "correctAnswer": "3125"
    },
    {
      "question": "3. Which company created Flutter?",
      "answers": ["Facebook", "Microsoft", "Google"],
      "correctAnswer": "Google"
    }
  ];

  int _questionIndex = 0;
  double _score = 0;
  bool _showScore = false;

  void _answerQuestion(answer) {
    setState(() {
      _score += (answer == _questions[_questionIndex]['correctAnswer'])
          ? 1 * 100 / _questions.length
          : 0;
      (_questionIndex < _questions.length - 1)
          ? _questionIndex++
          : _showScore = true;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _showScore = false;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Quiz App with Flutter"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            children: [
              !_showScore
                  ? Quiz(
                      questions: _questions,
                      answerQuestion: _answerQuestion,
                      questionIndex: _questionIndex)
                  : Result(score: _score, resetQuiz: _resetQuiz)
            ],
          ),
        ),
      ),
    );
  }
}
