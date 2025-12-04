import 'package:flutter/material.dart';
import 'models/quiz.dart';
import 'models/question.dart';
import 'models/answer.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget{
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const QuizHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({super.key});

  @override
  State<QuizHomePage> createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  late Quiz quiz;
  int currentQuestionIndex = 0;
  String? selectedAnswer;

  @override
  void initState() {
    super.initState();
    
  }
}