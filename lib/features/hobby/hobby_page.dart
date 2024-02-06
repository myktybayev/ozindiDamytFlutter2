import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';

class HobbyPage extends StatefulWidget {
  @override
  _HobbyPageState createState() => _HobbyPageState();
}

class _HobbyPageState extends State<HobbyPage> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Hobby Page'),
          ),
          drawer: DrawerMenu(), // Now you can use DrawerMenu
          body: Container(
            child: Center(
              child: Text("Hobby Page"),
            ),
          ),
        ),
      ),
    );
  }
}
