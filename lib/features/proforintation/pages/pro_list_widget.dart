import 'package:flutter/material.dart';
import 'package:ozindi_damyt/features/proforintation/pages/loadingpage.dart';
import 'package:url_launcher/url_launcher.dart';

List<Map<String, dynamic>> hobby = [
  {
    "id": 1,
    "photo": "assets/images/proforintation/img.png",
    "text": "Profonline.kz",
    "url": "https://profonline.kz"
  },
  {
    "id": 2,
    "photo": "assets/images/proforintation/img_1.png",
    "text": "Nova Education",
    "url": "https://novaedu.kz/"
  },
];

class ProListWidget extends StatefulWidget {
  const ProListWidget({Key? key}) : super(key: key);

  @override
  _ProListWidgetState createState() => _ProListWidgetState();
}

class _ProListWidgetState extends State<ProListWidget> {
  bool _loading = false;

  void _toggleLoading(bool value) {
    setState(() {
      _loading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? LoadingPage(
            onStopLoading: () {
              _toggleLoading(false);
            },
          )
        : Expanded(
            child: ListView.builder(
              itemCount: hobby.length,
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: GestureDetector(
                  onTap: () {
                    _launchURL(hobby[index]["url"]);
                  },
                  key: ValueKey(hobby[index]["id"]),
                  child: Stack(
                    children: [
                      Container(
                        width: 400,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 6,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 35, left: 60),
                          child: Text(
                            hobby[index]["text"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 270, top: 10),
                        child: Container(
                          width: 80,
                          height: 80,
                          child: Image.asset(
                            hobby[index]["photo"],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
