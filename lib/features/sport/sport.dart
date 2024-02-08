import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';
import 'package:ozindi_damyt/features/sport/pages/list.dart';

class SportPage extends StatelessWidget {
  const SportPage({super.key});

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
            title: Text('Sport'),
          ),
        ),
      ),
      body: SportListWidget(),
    );
  }
}
