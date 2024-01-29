import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/DrawerMenu.dart';

class PodcastPage extends StatelessWidget {
  const PodcastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text("Podcast Page"),
      ),
      body: Center(
        child: Text("Cinema page"),
      ),
    );
  }
}
