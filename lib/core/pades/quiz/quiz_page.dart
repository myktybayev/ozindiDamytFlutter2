import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/pades/quiz/features/quizziz_body.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text('Podcast Page'),
        ),
        body: QuizzizBody(),
      ),
    );
  }
}
