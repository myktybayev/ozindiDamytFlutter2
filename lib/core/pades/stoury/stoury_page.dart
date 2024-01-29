import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/DrawerMenu.dart';

class StouryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Stoury Page"),
      ),
      body: Center(
        child: Text("Cinema page"),
      ),
    );
  }
}
