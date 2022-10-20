import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/models/question_models.dart';
import 'package:quiz_app/screens/result_page.dart';
import 'package:quiz_app/utils/images.dart';
import 'package:quiz_app/widgets/answer_widget.dart';
import 'package:quiz_app/widgets/question_widget.dart';
import 'package:quiz_app/widgets/timer_widget.dart';
import 'package:quiz_app/widgets/progres_widget';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key, questions}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int currentQuestionIndex = 0;

  int start = 15;

  String buttonText = "Next";

  Map<int, bool> userResult = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
  };

  @override
  void initState() {
    super.initState();

    QuestionModel.PoytaxtQuestion.map((q) {
      q.option1.isSelected = false;
      q.option2.isSelected = false;
      q.option3.isSelected = false;
      q.option4.isSelected = false;
    }).toList();

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (start != 0) {
        setState(() {
          start--;
        });
      } else {
        nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(child: SvgPicture.asset(MyImages.icon_logo)),
      ),
      body: Column(
        children: [
          SizedBox(height: 64),
          ProgressWidget(
            currentWidth: (MediaQuery.of(context).size.width * 0.78) *
                ((currentQuestionIndex + 1) / QuestionModel.PoytaxtQuestion.length),
          ),
          SizedBox(height: 12),
          Stack(
            children: [
              Positioned(
                child: TimerWidget(second: start),
                top: 10,
                left: 10,
              ),
              Container(
                height: 60,
                width: 60,
                child: TweenAnimationBuilder<double>(
                  builder: (BuildContext context, value, Widget? child) {
                    return CircularProgressIndicator(
                      strokeWidth: 6,
                      backgroundColor: Colors.transparent,
                      color: Colors.red,
                      value: value,
                    );
                  },
                  tween: Tween<double>(begin: 0.0, end: start / 15),
                  duration: const Duration(seconds: 1),
                ),
              ),
            ],
          ),
          QuestionWidget(
            questionTitle:
                QuestionModel.PoytaxtQuestion[currentQuestionIndex].question,
            index: currentQuestionIndex + 1,
          ),
          AnswersWidget(
            onAnswerSelected: (isTrue) {
              userResult[currentQuestionIndex] = isTrue;
            },
            questionModel: QuestionModel.PoytaxtQuestion[currentQuestionIndex],
          ),
          const SizedBox(height: 24),
          ElevatedButton(onPressed: nextQuestion, child: Text(buttonText))
        ],
      ),
    );
  }

  nextQuestion() {
    setState(() {
      if (buttonText == "Finish") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              userResult: userResult,
            ),
          ),
        );
      }
      if (currentQuestionIndex != QuestionModel.PoytaxtQuestion.length - 1) {
        start = 15;
        currentQuestionIndex++;
      }
      if (currentQuestionIndex == QuestionModel.PoytaxtQuestion.length - 1) {
        buttonText = "Finish";
      }
    });
  }
}