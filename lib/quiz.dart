import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return managing();
  }
}

class managing extends State<Quiz> {
  //first method to conditionally render and lifting the state up using initState
// why using the initState: the active screen and the initialization of switchScreen method happens at the same time when initalizing the class, therefor we cant pass the method to StartScreen hence the method is not created yet, so we use initState- since init State will invoke after building the class

  // Widget? activeScreen;
  // // we can store widgets in variable hence they are objects after all // we can pass the method to the startScreen widget to invoke it there

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }
  // //initState Executed by Flutter when the StatefulWidget's State object is initialized
  // // it will execute only once
  // void switchScreen() {
  //   setState(() {
  //     activeScreen = QuestionsScreen();
  //   });
  // }

// Second method is using Ternary operator

// managing the state here since this widget holds both the QuestionsScreen and the ResultScreen
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void onResetQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    final screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : activeScreen == 'results-screen'
            ? ResultsScreen(
                chosenAnswers: selectedAnswers,
                onResetQuiz: onResetQuiz,
              )
            : QuestionsScreen(
                onSelectAnswer: chooseAnswer,
              );

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 76, 26, 161),
                  Color.fromARGB(255, 108, 39, 228),
                ],
              ),
            ),
            // child: activeScreen, // use this line for the first method
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}
