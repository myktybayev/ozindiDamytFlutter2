import 'package:flutter/material.dart';
import 'package:ozindi_damyt/features/podcast/data/podcast_data.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchBarView extends StatefulWidget implements PreferredSizeWidget {
  const SearchBarView({super.key});

  @override
  State<SearchBarView> createState() => _SearchBarViewState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _SearchBarViewState extends State<SearchBarView> {
  final List<Map<String, dynamic>> data =
      (card_descrip.expand<Map<String, dynamic>>(
          (item) => item['podcasts'] as List<Map<String, dynamic>>)).toList();

  List<Map<String, dynamic>> _cards = [];

  @override
  void initState() {
    _cards = data;
    super.initState();
  }

  void _runFilter(String enteredWord) {
    List<Map<String, dynamic>> results = [];
    if (enteredWord.isEmpty) {
      results = data;
    } else {
      results = (data as List<Map<String, dynamic>>)
          .where((Map<String, dynamic> user) =>
              user['name'].toLowerCase().contains(enteredWord.toLowerCase()))
          .toList();
    }
    setState(() {
      _cards = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text('Подкасттар', style: TextStyle(color: Colors.black)),
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: () {},
      ),
      actions: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(cards: _cards),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'Білім подкасттары',
    'Жаңалықтар',
    'Сұхбат',
    'Әдеби',
    'Спорт подкасттары',
  ];

  final List<Map<String, dynamic>> cards;

  MySearchDelegate({required this.cards});

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                mainAxisExtent: 210,
              ),
              itemCount: cards.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () async {
                    final url = Uri.parse(cards[index]["url"]);
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          child: Image.asset(
                            "podcast/${cards[index]['photo']}",
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                cards[index]['name'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  ImageIcon(
                                    AssetImage(cards[index]['logo']),
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    cards[index]['subtitle'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade800,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    cards[index]['lang'],
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
