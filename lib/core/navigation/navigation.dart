import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/my_header_drawer.dart';
import 'package:ozindi_damyt/core/pades/cinema/cinema_page.dart';
import 'package:ozindi_damyt/core/pades/hobby/hobby_page.dart';
import 'package:ozindi_damyt/core/pades/library/library_page.dart';
import 'package:ozindi_damyt/core/pades/maraphone/maraphone_page.dart';
import 'package:ozindi_damyt/core/pades/new_recommendation/new_recommendation_page.dart';
import 'package:ozindi_damyt/core/pades/podcast/podcast_page.dart';
import 'package:ozindi_damyt/core/pades/proforintation/proforintation_page.dart';
import 'package:ozindi_damyt/core/pades/quiz/quiz_page.dart';
import 'package:ozindi_damyt/core/pades/sport/sport_page.dart';
import 'package:ozindi_damyt/core/pades/stoury/stoury_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  var currentPage = DrawerSections.library;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.library) {
      container = LibraryPage();
    } else if (currentPage == DrawerSections.stoury) {
      container = StouryPage();
    } else if (currentPage == DrawerSections.podcast) {
      container = PodcastPage();
    } else if (currentPage == DrawerSections.quiz) {
      container = QuizPage();
    } else if (currentPage == DrawerSections.maraphone) {
      container = MaraphonePage();
    } else if (currentPage == DrawerSections.proforintation) {
      container = ProforintationPage();
    } else if (currentPage == DrawerSections.hobby) {
      container = HobbyPage();
    } else if (currentPage == DrawerSections.sport) {
      container = SportPage();
    } else if (currentPage == DrawerSections.cinema) {
      container = CinemaPage();
    } else if (currentPage == DrawerSections.new_recommendation) {
      container = NewRecommendationPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Ozindi Damyt'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [MyHeaderDrawer(), MyDrawerList()],
        ),
      ),
      body: container,
    );
  }

  @override
  Widget MyDrawerList() {
    return Column(
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
