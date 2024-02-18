import 'package:flutter/material.dart';
import 'package:quiz/questionscreen.dart';
import 'startscreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffd700fc),
        body: Container(
          child: Center(
            child: activeScreen,
          ),
        ),
      ),
    );
  }
}
