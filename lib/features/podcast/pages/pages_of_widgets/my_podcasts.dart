import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ozindi_damyt/features/podcast/data/database_helper.dart';
import 'package:ozindi_damyt/features/podcast/pages/pages_of_widgets/add_podcast.dart';

class MyPodcasts extends StatefulWidget {
  const MyPodcasts({Key? key});
  @override
  State<MyPodcasts> createState() => _MyPodcastsState();
}

class _MyPodcastsState extends State<MyPodcasts> {
  List<Map<String, dynamic>> dataList = [];

  @override
  void initState() {
    fetchCards();
    super.initState();
  }

  void fetchCards() async {
    List<Map<String, dynamic>> cardsList = await DatabaseHelper.getData();
    setState(() {
      dataList = cardsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Менің подкасттарым',
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
              size: 38,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddPodcast()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            mainAxisExtent: 200,
          ),
          itemCount: dataList.length,
          itemBuilder: (_, index) {
            return Container(
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
                    child: Image.memory(
                      dataList[index]['image'] ?? Uint8List(0),
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
                          dataList[index]['name'] ?? 'No Name',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 10),
                            ImageIcon(
                              AssetImage('assets/images/circle_logo.webp'),
                              color: Colors.green,
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Sophie',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade800,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'rus',
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
            );
          },
        ),
      ),
    );
  }
}
