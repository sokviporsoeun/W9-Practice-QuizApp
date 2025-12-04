class Answer {
  final String answerChoice;

  Answer({required this.answerChoice});

  bool isGood(String correctAnswer){
    return answerChoice == correctAnswer;
  }
}