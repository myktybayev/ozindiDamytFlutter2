import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: DrawerMenu(),
        appBar: AppBar(
          title: Text('Library Page'),
        ),
        body: Center(
          child: Text('Kitaphana Page'),
        ),
      ),
    );
  }
}
