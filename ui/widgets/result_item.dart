import 'package:flutter/material.dart';
import 'question_indentifier.dart';

class ResultItem extends StatelessWidget{
  final int questionNumber;
  final String questionTitle;
  final String userAnswer;
  final String correctAnswer;
  final bool isCorrect;

  const ResultItem({
    super.key,
    required this.questionNumber,
    required this.questionTitle,
    required this.userAnswer,
    required this.correctAnswer,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(vertical:8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIndentifier(questionNumber: questionNumber, isCorrect: isCorrect),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questionTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  userAnswer,
                  style: TextStyle(
                    color: isCorrect ? Colors.green : Colors.red,
                    fontSize: 14,
                  ),
                ),
                
                // Text(
                //   ' $answerChoice',
                //   style: const TextStyle(
                //     color: Colors.green,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            )
          )
        ],
      ),
    );
  }
} 