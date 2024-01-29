import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AllPodcast extends StatefulWidget {
  final Map<String, dynamic> item;
  const AllPodcast({Key? key, required this.item}) : super(key: key);

  @override
  State<AllPodcast> createState() => _AllPodcastState();
}

class _AllPodcastState extends State<AllPodcast> {
  List<Map<String, dynamic>> _foundCard = [];

  @override
  void initState() {
    _foundCard = widget.item["podcasts"];
    super.initState();
  }

  //search filter
  void _runFilter(String enteredWord) {
    List<Map<String, dynamic>> results = [];
    if (enteredWord.isEmpty) {
      results = widget.item["podcasts"];
    } else {
      results = (widget.item["podcasts"] as List<Map<String, dynamic>>)
          .where((Map<String, dynamic> user) =>
              user['name'].toLowerCase().contains(enteredWord.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundCard = results;
    });
  }

  //filter language
  void sortLan(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.contains("rus")) {
      results = (widget.item["podcasts"] as List<Map<String, dynamic>>?)
              ?.where((Map<String, dynamic>? user) =>
                  (user?["lang"] as String?)
                      ?.toLowerCase()
                      .contains(enteredKeyword.toLowerCase()) ??
                  false)
              .toList() ??
          [];
    } else if (enteredKeyword.contains("kaz")) {
      results = (widget.item["podcasts"] as List<Map<String, dynamic>>?)
              ?.where((Map<String, dynamic>? user) =>
                  (user?["lang"] as String?)
                      ?.toLowerCase()
                      .contains(enteredKeyword.toLowerCase()) ??
                  false)
              .toList() ??
          [];
    } else {
      results = widget.item["podcasts"] ?? [];
    }
    setState(() {
      _foundCard = results;
    });
  }

  Widget ButtonKaz() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Theme.of(context).colorScheme.primary.withOpacity(0.5);
            }
            return null;
          },
        ),
      ),
      child: const Text('KAZ'),
      onPressed: () {
        sortLan("kaz");
      },
    );
  }

  Widget ButtonRus() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Theme.of(context).colorScheme.primary.withOpacity(0.5);
            }
            return null;
          },
        ),
      ),
      child: const Text('RUS'),
      onPressed: () {
        sortLan("rus");
      },
    );
  }

  Widget ButtonAll() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Theme.of(context).colorScheme.primary.withOpacity(0.5);
            }
            return null;
          },
        ),
      ),
      child: const Text('ALL'),
      onPressed: () {
        sortLan("all");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Барлығын көру',
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.filter_alt_sharp, color: Colors.black),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("RUS"),
                value: "RUS",
                onTap: () {
                  sortLan("rus");
                },
              ),
              PopupMenuItem(
                child: Text("KAZ"),
                value: "KAZ",
                onTap: () {
                  sortLan("kaz");
                },
              ),
              PopupMenuItem(
                child: Text("ALL"),
                value: "ALL",
                onTap: () {
                  sortLan("all");
                },
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: TextField(
                    onChanged: (String value) => _runFilter(value),
                    decoration: InputDecoration(
                      hintText: 'Іздеу',
                      labelStyle: TextStyle(
                          color: Colors.black12, fontWeight: FontWeight.w500),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.search,
                          color: Colors.black87, size: 25),
                    ),
                  ),
                ),
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
                  itemCount: _foundCard.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () async {
                        final url = Uri.parse(_foundCard[index]["url"]);
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
                                _foundCard[index]['photo'],
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
                                    _foundCard[index]['name'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      ImageIcon(
                                        AssetImage(_foundCard[index]['logo']),
                                        size: 20,
                                        color: Colors.amber,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        _foundCard[index]['subtitle'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade800,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        _foundCard[index]['lang'],
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
        ),
      ),
    );
  }
}
