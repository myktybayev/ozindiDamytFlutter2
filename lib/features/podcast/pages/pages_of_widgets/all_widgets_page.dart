import 'package:flutter/material.dart';
import 'package:ozindi_damyt/features/podcast/data/podcast_data.dart';
import 'package:ozindi_damyt/features/podcast/pages/pages_of_widgets/all_podcasts.dart';
import 'package:ozindi_damyt/features/podcast/pages/pages_of_widgets/my_podcasts.dart';
import 'package:url_launcher/url_launcher.dart';

class AllWidgetsPage extends StatefulWidget {
  const AllWidgetsPage({Key? key});

  @override
  State<AllWidgetsPage> createState() => _AllWidgetsPageState();
}

class _AllWidgetsPageState extends State<AllWidgetsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 10),
            _bigCard(),
            const SizedBox(height: 10),
            Expanded(
              child: PodcastListView(podcastTypes: card_descrip),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bigCard() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15.0), // Set the border radius here
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/podcast/main_img.png'),
            const Positioned(
              left: 20,
              child: Text(
                'Подкаст\nтыңдауға ыңғайлы\nпрограмма',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              width: 120,
              left: 240,
              child: IconButton(
                icon: Image.asset(
                  'assets/icons/google_podcasts_iconn.png',
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PodcastListView extends StatelessWidget {
  final List<Map<String, dynamic>> podcastTypes;
  PodcastListView({required this.podcastTypes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: podcastTypes.length,
      itemBuilder: (context, index) {
        String title = podcastTypes[index]['title'];
        List<Map<String, dynamic>> podcastsCards =
            podcastTypes[index]['podcasts'];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyPodcasts()));
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return AllPodcast(
                              item: card_descrip.elementAt(index),
                            );
                          }),
                        );
                      }
                    },
                    child: ListTile(
                      title: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Kөру',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500)),
                          Icon(Icons.keyboard_arrow_right,
                              color: Colors.grey.shade800, size: 26),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: podcastsCards.length,
                itemBuilder: (context, podcastIndex) {
                  Map<String, dynamic> podcast = podcastsCards[podcastIndex];
                  return GestureDetector(
                    onTap: () async {
                      final url = Uri.parse(podcast["url"]);
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: Container(
                      width: 140,
                      height: 240,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.0,
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
                              podcast['photo'],
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  podcast['name'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    ImageIcon(
                                      AssetImage(podcast['logo']),
                                      size: 20,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      podcast['subtitle'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade700,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      podcast['lang'],
                                      style: const TextStyle(
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
            ),
          ],
        );
      },
    );
  }
}
