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
      appBar: AppBar(
        title: Text('Library Page'),
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
