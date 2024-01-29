import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';

class CinemaPage extends StatefulWidget {
  @override
  _CinemaPageState createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cinema page'),
      ),
      body: Center(
        child: Text("Cinema page"),
      ),
    );
  }
}
