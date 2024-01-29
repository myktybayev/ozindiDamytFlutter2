import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text('Quiz Page'),
      ),
      body: Center(
        child: Text('Quiz Page'),
      ),
    );
  }
}
