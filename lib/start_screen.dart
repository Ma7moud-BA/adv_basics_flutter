import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(void Function() this.startQuiz, {super.key});
  // add this to the constructor  arguments "void Function() this.startQuiz" - if the first method used
  final void Function() startQuiz; // add this if the first method used

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(144, 255, 255, 255),
          ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            "Learn Flutter The Fun Way",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            //using the .icon constructor to add an icon to the button
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white, // Sets the text color correctly
              textStyle: const TextStyle(
                  fontSize: 28), // Only for font size and weight
              minimumSize: const Size(50, 50), // Makes the button square
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                // Sharp corners
              ),
            ),
            icon: Icon(Icons.arrow_right_alt),
            label: const Text("Start Quiz"),
          )
        ],
      ),
    );
  }
}
