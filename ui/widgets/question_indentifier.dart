import 'package:flutter/material.dart';

class QuestionIndentifier extends StatelessWidget{
  final int questionNumber;
  final bool isCorrect;

  const QuestionIndentifier({
    super.key,
    required this.questionNumber,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context){
    return Container( 
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: isCorrect ? Colors.green : Colors.red,
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    );
  }

}