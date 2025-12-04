import 'package:flutter/material.dart';
import 'models/quiz.dart';
import 'models/answer.dart';
import 'ui/screens/start_screen.dart';
import 'ui/screens/question_screen.dart';
import 'ui/screens/result_screen.dart';
import 'data/storages/quiz.dart' as storages;

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: const QuizHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  late Quiz quiz;
  int currentQuestionIndex = 0;
  String currentScreen = 'start'; // 'start', 'question', 'result'

  @override
  void initState() {
    super.initState();
    initializeQuiz();
  }

  void initializeQuiz() {
    quiz = storages.quiz;
  }

  void startQuiz() {
    setState(() {
      currentScreen = 'question';
      currentQuestionIndex = 0;
    });
  }

  void answerQuestion(Answer answer) {
    quiz.answerQuestion(answer);

    setState(() {
      if (currentQuestionIndex < quiz.questions.length - 1) {
        // Move to next question
        currentQuestionIndex++;
      } else {
        // All questions answered, show result
        currentScreen = 'result';
      }
    });
  }

  void restartQuiz() {
    setState(() {
      currentScreen = 'start';
      currentQuestionIndex = 0;
      initializeQuiz(); // Reset quiz
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (currentScreen == 'start') {
            return StartScreen(startQuiz: startQuiz);
          } else if (currentScreen == 'question') {
            return QuestionScreen(
              question: quiz.questions[currentQuestionIndex],
              onAnswerSelected: answerQuestion,
            );
          } else {
            return ResultScreen(
              quiz: quiz,
              onRestartQuiz: restartQuiz,
            );
          }
        },
      ),
    );
  }
}