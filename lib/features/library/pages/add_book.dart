import 'package:flutter/material.dart';
import 'package:ozindi_damyt/features/library/models/book_access.dart';
import 'package:provider/provider.dart';

class AddBook extends StatelessWidget {
  AddBook({Key? key}) : super(key: key);
  final TextEditingController bookNameController = TextEditingController();
  final TextEditingController bookAuthorController = TextEditingController();
  final TextEditingController bookDescController = TextEditingController();
  final TextEditingController bookUrlController = TextEditingController();
  final TextEditingController bookSourceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var bookProvider = Provider.of<BookAccess>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(239, 239, 239, 1.0),
        title: Text("Кітапхана"),
        titleTextStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 16),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.info),
          )
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Add your book here',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                ),
              ),
              TextFormField(
                controller: bookNameController,
                decoration: const InputDecoration(
                  labelText: 'Enter name of book',
                ),
              ),
              TextFormField(
                controller: bookAuthorController,
                decoration: const InputDecoration(
                  labelText: 'Enter author of book',
                ),
              ),
              TextFormField(
                controller: bookDescController,
                decoration: const InputDecoration(
                  labelText: 'Enter description of book',
                ),
                maxLines: 4,
              ),
              TextFormField(
                controller: bookUrlController,
                decoration: const InputDecoration(
                  labelText: 'Paste image url of book',
                ),
              ),
              TextFormField(
                controller: bookSourceController,
                decoration: const InputDecoration(
                  labelText: 'Enter reading source of book',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    bookProvider.addBook(
                        bookNameController.text,
                        bookAuthorController.text,
                        bookUrlController.text,
                        bookDescController.text,
                        bookSourceController.text);
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
