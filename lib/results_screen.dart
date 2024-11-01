import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onResetQuiz});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      // {} is dart syntax to create a map value
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          // the first answer the in answers list is the correct one
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  final void Function() onResetQuiz;
  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Answered $numCorrectQuestions  Out Of $numTotalQuestions Questions Correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 228, 164, 240),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            SizedBox(height: 30),
            TextButton.icon(
              icon: Icon(Icons.refresh, color: Colors.white), // Icon color
              label: Text(
                "Restart Quiz!",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: onResetQuiz,
            )
          ],
        ),
      ),
    );
  }
}
