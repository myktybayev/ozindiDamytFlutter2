import 'package:flutter/material.dart';

class MyDrawerList extends StatefulWidget {
  const MyDrawerList({super.key});

  @override
  State<MyDrawerList> createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
  var currentPage = DrawerSections.library;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "Кітапхана", Icons.dashboard_outlined,
              currentPage == DrawerSections.library ? true : false),
          menuItem(2, "Ғибратты әңгімелер", Icons.people_alt_outlined,
              currentPage == DrawerSections.stoury ? true : false),
          menuItem(3, "Подкаст", Icons.event,
              currentPage == DrawerSections.podcast ? true : false),
          menuItem(4, "Quizz", Icons.notes,
              currentPage == DrawerSections.quiz ? true : false),
          Divider(),
          menuItem(5, "Марафон", Icons.settings_outlined,
              currentPage == DrawerSections.maraphone ? true : false),
          menuItem(6, "Профориентация", Icons.notifications_outlined,
              currentPage == DrawerSections.proforintation ? true : false),
          Divider(),
          menuItem(7, "Хобби", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.hobby ? true : false),
          menuItem(8, "Спорт", Icons.feedback_outlined,
              currentPage == DrawerSections.sport ? true : false),
          menuItem(9, "Кино", Icons.feedback_outlined,
              currentPage == DrawerSections.cinema ? true : false),
          menuItem(10, "Жаңа ұсыныстар", Icons.feedback_outlined,
              currentPage == DrawerSections.new_recommendation ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.red[200] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context as BuildContext);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.library;
            } else if (id == 2) {
              currentPage = DrawerSections.stoury;
            } else if (id == 3) {
              currentPage = DrawerSections.podcast;
            } else if (id == 4) {
              currentPage = DrawerSections.quiz;
            } else if (id == 5) {
              currentPage = DrawerSections.maraphone;
            } else if (id == 6) {
              currentPage = DrawerSections.proforintation;
            } else if (id == 7) {
              currentPage = DrawerSections.hobby;
            } else if (id == 8) {
              currentPage = DrawerSections.sport;
            } else if (id == 9) {
              currentPage = DrawerSections.cinema;
            } else if (id == 10) {
              currentPage = DrawerSections.new_recommendation;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  cinema,
  hobby,
  library,
  maraphone,
  new_recommendation,
  podcast,
  proforintation,
  quiz,
  sport,
  stoury
}
