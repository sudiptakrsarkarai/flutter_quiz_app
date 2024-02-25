import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map((data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(
                              color: Color(0xfff90707), fontSize: 16),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: const TextStyle(
                              color: Color(0xff04e33c), fontSize: 16),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }).toList(),
          ),
        )); //Convert Map Iterable to List
  }
}
