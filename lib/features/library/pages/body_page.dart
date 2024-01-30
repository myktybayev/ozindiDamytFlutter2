import 'package:flutter/material.dart';
import 'package:ozindi_damyt/features/library/models/book_access.dart';
import 'package:ozindi_damyt/features/library/pages/book_page.dart'; // Import your BookPage
import 'package:provider/provider.dart';

class BodyPage extends StatelessWidget {
  BodyPage({Key? key});

  @override
  Widget build(BuildContext context) {
    var bookProvider = Provider.of<BookAccess>(context);

    return Center(
      child: Column(
        children: [
          latestBookContainer(context, bookProvider.books),
          constantText("Жаңа кітаптар"),
          rowOfBooks(bookProvider.books),
          constantText("Ұсынылған"),
          rowOfBooks(bookProvider.books),
          constantText("Көп оқылған"),
          rowOfBooks(bookProvider.books),
        ],
      ),
    );
  }

  Widget latestBookContainer(BuildContext context, List books) {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/library/pole.jpeg'),
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5), // Adjust opacity as needed
            BlendMode.srcATop,
          ),
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image(books[books.length - 1].imageUrl),
          const SizedBox(width: 50),
          Expanded(
            child: Column(
              children: [
                const Text(
                  "Осы айдың ең жаңа кітабы",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 8),
                Text(
                  books[books.length - 1].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 3),
                Text(
                  books[books.length - 1].author,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget constantText(String text) {
    return Container(
      margin: EdgeInsets.only(left: 40),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              color: Colors.black),
        ),
      ),
    );
  }

  Widget rowOfBooks(List books) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 20),
      height: 180,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemExtent: 120,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BookPage(book: books[index])),
              );
            },
            child: Column(
              children: [
                image(books[index].imageUrl),
                SizedBox(
                  height: 5,
                ),
                Text(
                  books[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
                Text(
                  books[index].author,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal,
                      fontSize: 10),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget image(String url) {
    return Container(
      width: 80,
      height: 120,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            url,
          ),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
