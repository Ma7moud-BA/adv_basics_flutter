import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    // when we need to access the StatefulWidget properties in the state class we can use the widget method
    widget.onSelectAnswer(selectedAnswer);
    // changing the currentQuestionIndex will trigger the setState and will display different question
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 158, 60, 223),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              // Use flutter pub add google_fonts to download the package
              // https://docs.flutter.dev/cookbook/design/fonts
              // https://pub.dev/packages/google_fonts/install
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            //without the three dots ... - we will get an error becasue flutter doesn't accept a list inside another list so by using the ... spreading operator it will put the output of that list
            // we can't use .shuffle method directly here because it mutates the original one\
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answer, () {
                answerQuestion(answer);
              });
            })
          ],
        ),
      ),
    );
  }
}
