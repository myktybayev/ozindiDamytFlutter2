import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';
import 'package:ozindi_damyt/features/library/models/book_access.dart';
import 'package:ozindi_damyt/features/library/pages/body_page.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key});

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
            title: const Text('Кітапхана'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Provider<BookAccess>(
          create: (context) => BookAccess(),
          child: BodyPage(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_book');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
