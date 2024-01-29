import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/DrawerMenu.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text("Library Page"),
      ),
      body: Center(
        child: Text("Cinema page"),
      ),
    );
  }
}
