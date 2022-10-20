import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  String questionTitle;
  int index;

  QuestionWidget({
    Key? key,
    required this.questionTitle,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          Text(
            "Question - ${index}",
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Color(0xff6066D0),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            questionTitle,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}