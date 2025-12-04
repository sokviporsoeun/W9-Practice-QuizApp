import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback startQuiz;

  const StartScreen({super.key, required this.startQuiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            AppButton(
              label: 'Start Quiz',
              onPressed: startQuiz,
            ),
          ],
        ),
      ),
    );
  }
}