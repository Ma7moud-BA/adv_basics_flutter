class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // creating a copy of answers to prevent changing the order of the main one
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
