import 'package:flutter/material.dart';
import 'Animation.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.StartQuiz, {super.key});
  final void Function() StartQuiz;
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
          opacity: 0.5,
          child: AnimationFade(),
        ),
        const Padding(padding: EdgeInsets.only(top: 100)),
        textAnimated(),
        Text(
          "Learn Flutter the Fun Way",
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
        Padding(padding: EdgeInsets.all(10)),
        TextButton.icon(
            onPressed: StartQuiz,
            style: TextButton.styleFrom(
                padding: EdgeInsets.only(top: 20),
                foregroundColor: Color(0xff000000),
                textStyle: const TextStyle(fontSize: 28)),
            icon: Icon(Icons.lightbulb, color: Colors.yellow),
            label: Text('Start Quiz'))
      ],
    );
  }
}
