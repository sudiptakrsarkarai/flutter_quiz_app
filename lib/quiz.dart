import 'package:flutter/material.dart';

import 'startscreen.dart';
import 'questionscreen.dart';
import 'questions.dart';
import 'results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    if (activeScreen == 'results-screen') {
      screenWidget =
          ResultsScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 78, 13, 151),
        body: Center(
          child: Container(
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}
