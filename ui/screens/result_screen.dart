import 'package:flutter/material.dart';
import '../../models/quiz.dart';
import '../widgets/app_button.dart';
import '../widgets/result_item.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onRestartQuiz;

  const ResultScreen({
    super.key,
    required this.quiz,
    required this.onRestartQuiz,
  });

  @override
  Widget build(BuildContext context) {
    int correctAnswers = 0;
    for (int i = 0; i < quiz.answers.length; i++) {
      if (quiz.answers[i].isGood(quiz.questions[i].goodChoice)) {
        correctAnswers++;
      }
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered $correctAnswers on ${quiz.questions.length}!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < quiz.questions.length; i++)
                        ResultItem(
                          questionNumber: i + 1,
                          questionTitle: quiz.questions[i].title,
                          userAnswer: quiz.answers[i].answerChoice,
                          correctAnswer: quiz.questions[i].goodChoice,
                          isCorrect: quiz.answers[i]
                              .isGood(quiz.questions[i].goodChoice),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AppButton(
                label: 'Restart Quiz',
                onPressed: onRestartQuiz,
              ),
            ],
          ),
        ),
      ),
    );
  }
}