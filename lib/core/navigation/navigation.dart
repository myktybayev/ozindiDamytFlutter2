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
import 'package:pixel_perfect/pixel_perfect.dart';

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
    } else if (currentPage == DrawerSections.marathon) {
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
    return PixelPerfect(
      assetPath: 'assets/images/design.jpg',
      scale: 1,
      initBottom: 20,
      offset: Offset.zero,
      initOpacity: 0.4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Ozindi Damyt'),
        ),
        drawer: Drawer(
          width: 235,
          child: ListView(
            children: [
              MyHeaderDrawer(),
              const SizedBox(
                height: 13,
              ),
              MyDrawerList()
            ],
          ),
        ),
        body: container,
      ),
    );
  }

  @override
  Widget MyDrawerList() {
    return Column(
      children: [
        menuItem(1, "Кітапхана", "library.png",
            currentPage == DrawerSections.library ? true : false),
        sb2(),
        menuItem(2, "Ғибратты әңгімелер", "stoury.png",
            currentPage == DrawerSections.stoury ? true : false),
        sb2(),
        menuItem(3, "Подкаст", "podcast.png",
            currentPage == DrawerSections.podcast ? true : false),
        sb2(),
        menuItem(4, "Quiziz", "quiz.png",
            currentPage == DrawerSections.quiz ? true : false),
        sb2(),
        menuItem(5, "Марафон", "marathon.png",
            currentPage == DrawerSections.marathon ? true : false),
        sb2(),
        menuItem(6, "Профориентация", "proforintation.png",
            currentPage == DrawerSections.proforintation ? true : false),
        sb2(),
        menuItem(7, "Хобби", "hobby.png",
            currentPage == DrawerSections.hobby ? true : false),
        sb2(),
        menuItem(8, "Спорт", "sport.png",
            currentPage == DrawerSections.sport ? true : false),
        sb2(),
        menuItem(9, "Кино", "movies.png",
            currentPage == DrawerSections.cinema ? true : false),
        sb2(),
        menuItem(10, "Жаңа ұсыныстар", "new_recommendation.png",
            currentPage == DrawerSections.new_recommendation ? true : false),
        sb2(),
      ],
    );
  }

  Widget menuItem(int id, String title, String icon, bool selected) {
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
              currentPage = DrawerSections.marathon;
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
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Image(
                image: AssetImage('assets/icons/$icon'),
                height: 20,
                width: 20,
              ),
              const SizedBox(
                width: 17,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

SizedBox sb2() {
  return const SizedBox(
    height: (2.4),
  );
}

enum DrawerSections {
  cinema,
  hobby,
  library,
  marathon,
  new_recommendation,
  podcast,
  proforintation,
  quiz,
  sport,
  stoury
}
