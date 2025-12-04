import 'package:flutter/material.dart';
import '../../models/answer.dart';
import '../../models/question.dart';
import '../widgets/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  final Question question;
  final Function(Answer) onAnswerSelected;

  const QuestionScreen({
    super.key,
    required this.question,
    required this.onAnswerSelected,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen>{
  String? selectedAnswer;

  void selectAnswer(String answer){
    setState((){
      selectedAnswer = answer;
    });
    widget.onAnswerSelected(Answer(answerChoice: answer));
  }
  @override
  Widget build(BuildContext context){
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
                widget.question.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ...widget.question.choices.map((choice){
                return AnswerButton(
                  text: choice,
                  isSelected: selectedAnswer == choice,
                  onTap: () => selectAnswer(choice),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}