import 'package:flutter/material.dart';
import 'package:ozindi_damyt/features/podcast/pages/pages_of_widgets/all_widgets_page.dart';

class PodcastPage extends StatelessWidget {
  const PodcastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AllWidgetsPage(),
      ),
    );
  }
}
