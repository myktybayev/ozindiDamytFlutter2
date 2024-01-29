import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/DrawerMenu.dart';

class HobbyPage extends StatefulWidget {
  @override
  _HobbyPageState createState() => _HobbyPageState();
}

class _HobbyPageState extends State<HobbyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text("Hobby Page"),
      ),
      body: Center(
        child: Text("Cinema page"),
      ),
    );
  }
}
