import 'package:flutter/material.dart';

class QuizzizScreen extends StatefulWidget {
  const QuizzizScreen({Key? key}) : super(key: key);

  @override
  _QuizzizScreenState createState() => _QuizzizScreenState();
}

class _QuizzizScreenState extends State<QuizzizScreen> {
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Who is the owner of Flutter?',
      'options': ['Google', 'Facebook', 'Apple', 'Samsung'],
      'correctAnswer': 'Google',
    },
    {
      'question': 'Which programming language is Flutter based on?',
      'options': ['Java', 'Kotlin', 'Dart', 'Swift'],
      'correctAnswer': 'Dart',
    },
    {
      'question': 'What widget is used to create a button in Flutter?',
      'options': ['Text', 'Button', 'FlatButton', 'ElevatedButton'],
      'correctAnswer': 'ElevatedButton',
    },
    {
      'question': 'What is the main function in a Dart program?',
      'options': ['mainFunction', 'start', 'runApp', 'main'],
      'correctAnswer': 'main',
    },
    {
      'question': 'What is Flutter?',
      'options': [
        'A programming language',
        'A mobile development framework',
        'A design pattern',
        'An IDE'
      ],
      'correctAnswer': 'A mobile development framework',
    },
    {
      'question': 'What is the primary purpose of setState() in Flutter?',
      'options': [
        'To rebuild the widget tree',
        'To change the app\'s theme',
        'To create a new widget',
        'To handle user input'
      ],
      'correctAnswer': 'To rebuild the widget tree',
    },
    {
      'question': 'What is the Dart SDK?',
      'options': [
        'Software Development Kit',
        'System Development Kit',
        'Swift Development Kit',
        'Simple Development Kit'
      ],
      'correctAnswer': 'Software Development Kit',
    },
  ];

  int currentQuestionIndex = 0;
  String? selectedOption;
  bool isAnswered = false;
  List<bool> results = [];
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizziz App'),
      ),
      body: _buildQuizzizScreen(),
    );
  }

  Widget _buildQuizzizScreen() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildQuestionCard(),
          SizedBox(height: 16),
          _buildOptions(),
          SizedBox(height: 16),
          if (isAnswered && currentQuestionIndex == questions.length - 1)
            _buildCommentSection(),
          SizedBox(height: 16),
          if (isAnswered) _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildQuestionCard() {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex]['question'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptions() {
    List<String> options =
        List.from(questions[currentQuestionIndex]['options']);

    return Column(
      children: options
          .map(
            (option) => RadioListTile(
              title: Text(option),
              value: option,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value as String?;
                  isAnswered = true;
                  results.add(value ==
                      questions[currentQuestionIndex]['correctAnswer']);
                });
              },
            ),
          )
          .toList(),
    );
  }

  Widget _buildNextButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (currentQuestionIndex == questions.length - 1) {
            _showResultsDialog();
          } else {
            isAnswered = false;
            currentQuestionIndex++;
            selectedOption = null;
          }
        });
      },
      child: Text(currentQuestionIndex == questions.length - 1
          ? 'Finish'
          : 'Next Question'),
    );
  }

  Widget _buildCommentSection() {
    return Column(
      children: [
        TextField(
          controller: commentController,
          decoration: InputDecoration(
            labelText: 'Your Comment',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Handle comment submission
            String comment = commentController.text;
            print('Submitted Comment: $comment');
          },
          child: Text('Submit Comment'),
        ),
      ],
    );
  }

  void _showResultsDialog() {
    int correctAnswers = results.where((result) => result).length;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Results'),
          content: Column(
            children: [
              Text('Correct Answers: $correctAnswers/${questions.length}'),
              SizedBox(height: 16),
              Text(
                  'Incorrect Answers: ${questions.length - correctAnswers}/${questions.length}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
