import 'package:flutter/material.dart';

import 'quizziz_screen.dart';

class QuizzizBody extends StatelessWidget {
  const QuizzizBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _quizzizView(context);
  }
}

Widget _quizzizView(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                _quizList(context),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _quizList(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: <Widget>[
        _listItem(
          Image.asset('assets/images/android.jpeg'),
          'Андроид сабағы',
          context,
        ),
        SizedBox(
          height: 16,
        ),
        _listItem(
          Image.asset('assets/images/flutter.jpeg'),
          'Dart & Flutter сабағы',
          context,
        ),
        SizedBox(
          height: 16,
        ),
        _listItem(
          Image.asset('assets/images/blender.jpeg'),
          'Full-stack веб сабағы',
          context,
        ),
        SizedBox(
          height: 16,
        ),
        _listItem(
          Image.asset('assets/images/kotlin.jpeg'),
          'Full-stack веб сабағы',
          context,
        ),
        SizedBox(
          height: 16,
        ),
        _listItem(
          Image.asset('assets/images/java.jpeg'),
          'Full-stack веб сабағы',
          context,
        ),
        SizedBox(
          height: 16,
        ),
        _listItem(
          Image.asset('assets/images/full_stack.jpeg'),
          'Full-stack веб сабағы',
          context,
        ),
      ],
    ),
  );
}

Widget _listItem(Image img, String title, BuildContext context) {
  return Container(
    width: 380,
    height: 100,
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: img,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizzizScreen()),
                    );
                  },
                  child: Text(
                    "Тестті тапсыру",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
