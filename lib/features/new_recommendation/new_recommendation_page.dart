import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';

class NewRecommendationPage extends StatelessWidget {
  const NewRecommendationPage({super.key});

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
                )
              ],
            ),
            child: AppBar(
              title: Text('New Recommendation page'),
            ),
          ),
        ),
        body: Center(child: Text("New Recommendation page")));
  }
}
