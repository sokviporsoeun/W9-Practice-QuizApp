class Question {
  final String title;
  final List<String> Choices;
  final String goodChoice;
  final int points;

  Question({
    required this.title,
    required this.Choices,
    required this.goodChoice,
    required this.points,
  });
}