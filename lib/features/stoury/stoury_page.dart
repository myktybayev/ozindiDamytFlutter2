import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';

class StouryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: PreferredSize(
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
          child: AppBar(
            shadowColor: Colors.black,
            title: Text('Stoury Page'),
          ),
        ),
      ),
      body: Center(
        child: Text("Stoury Page"),
      ),
    );
  }
}
