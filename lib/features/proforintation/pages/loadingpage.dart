import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  final Function onStopLoading;
  LoadingPage({required this.onStopLoading});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onStopLoading();
              },
              child: Text('Stop Loading'),
            ),
          ],
        ),
      ),
    );
  }
}
