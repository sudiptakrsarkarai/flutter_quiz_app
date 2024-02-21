import 'package:flutter/material.dart';
import 'package:quiz/questions.dart';
import 'answer_button.dart';
import 'questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion() {
    setState(() {
      currentQuestionIndex = currentQuestionIndex + 1;
      if (currentQuestionIndex >= 6) {
        currentQuestionIndex = 0;
      }
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = question[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: AnswerButton(
                      answerText: answer,
                      onTap: answerQuestion,
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
