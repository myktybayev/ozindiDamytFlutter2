import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/DrawerMenu.dart';

class MaraphonePage extends StatelessWidget {
  const MaraphonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text("Maraphone Page"),
      ),
      body: Center(
        child: Text("Cinema page"),
      ),
    );
  }
}
