import 'package:flutter/material.dart';
import 'package:ozindi_damyt/features/cinema/page/data/data.dart';

class CatalogWidget extends StatelessWidget {
  const CatalogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 250,
          child: ListKino(),
        ),
        SizedBox(
          height: 250,
          child: ListKino(),
        ),
        SizedBox(
          height: 250,
          child: ListKino(),
        ),
      ],
    );
  }
}

class ListKino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cinema_list.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            margin: EdgeInsets.all(8),
            height: 160,
            width: 140,
            child: CardKino(
              index: index,
            ),
          ),
        );
      },
    );
  }
}

class CardKino extends StatelessWidget {
  int index;
  CardKino({required this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            cinema_list[index]["photo"],
            width: 140,
            height: 160,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
          ),
          child: Text(cinema_list[index]["name"] as String),
        ),
      ],
    );
  }
}
