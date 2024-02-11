import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';
import 'package:ozindi_damyt/features/cinema/page/catalog_widget.dart';

class CinemaPage extends StatefulWidget {
  @override
  _CinemaPageState createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
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
            actions: const [
              Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.filter_list,
                color: Colors.black,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
            ],
            title: const Text('Кино'),
          ),
        ),
      ),
      body: CatalogWidget(),
    );
  }
}
