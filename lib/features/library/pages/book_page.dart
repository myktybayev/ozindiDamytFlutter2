import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ozindi_damyt/features/library/models/book_details.dart';
import 'package:url_launcher/url_launcher.dart';

class BookPage extends StatelessWidget {
  final Book? book; // Declare book as nullable
  BookPage({Key? key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: bodyPage(context),
      ),
    );
  }

  Widget bodyPage(BuildContext context) {
    if (book == null) {
      // Handle case where book is null
      return Center(
        child: Text('Book not found'),
      );
    }

    return Column(
      children: [
        Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(book!.imageUrl),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    height: 220,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          book!.imageUrl,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Column(
                      children: [
                        commonText(book!.title, FontWeight.bold),
                        commonText(book!.author, FontWeight.normal)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: commonText(
            book!.description,
            FontWeight.normal,
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(200, 60),
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              _launchURL(
                Uri.parse(book!.source),
              );
            },
            child: const Text(
              '    Оқу    ',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Widget commonText(data, FontWeight fontWeight,
      {textAlign = TextAlign.center}) {
    return Text(
      data,
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'Montserrat',
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }

  _launchURL(Uri url) async {
    if (await canLaunch(url.toString())) {
      // Fixed function calls
      await launch(url.toString());
    } else {
      throw 'Could not launch $url';
    }
  }
}
