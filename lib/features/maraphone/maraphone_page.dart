import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';

class MaraphonePage extends StatelessWidget {
  const MaraphonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
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
          child: AppBar(
            title: Text('Maraphone Page'),
          ),
        ),
      ),
      body: Center(
        child: Text('Maraphone Page'),
      ),
    );
  }
}
