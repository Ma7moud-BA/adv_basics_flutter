import 'package:adv_basics/models/quiz_questions.dart';

// the first answer the in answers list is the correct one
const questions = [
  QuizQuestion('What are the main building blocks of flutter UIs', [
    'Widgets',
    'Components',
    'Blocks',
    'Functions',
  ]),
  QuizQuestion(
      'What language is primarily used to develop Flutter applications?', [
    'Dart',
    'JavaScript',
    'Python',
    'Java',
  ]),
  QuizQuestion('Which widget allows user interaction in Flutter?', [
    'GestureDetector',
    'ListView',
    'Container',
    'Text',
  ]),
  QuizQuestion('Which layout widget arranges its children vertically?', [
    'Column',
    'Row',
    'Stack',
    'Container',
  ])
];
