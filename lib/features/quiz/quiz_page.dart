import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';
import 'package:ozindi_damyt/features/quiz/features/quizziz_body.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: DrawerMenu(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Quiz Page'),
        ),
        body: QuizzizBody(),
      ),
    );
  }
}
