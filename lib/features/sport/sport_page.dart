import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';

class SportPage extends StatelessWidget {
  const SportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
            ),
          ],
        ),
        child: Scaffold(
          drawer: DrawerMenu(),
          appBar: AppBar(
            title: Text('Sport Page'),
          ),
          body: Center(
            child: Text('Sport Page'),
          ),
        ),
      ),
    );
  }
}
