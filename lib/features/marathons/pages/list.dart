import 'package:flutter/material.dart';
import 'package:ozindi_damyt/features/hobby/pages/loadingpage.dart';

List<Map<String, dynamic>> marathone = [
  {
    "id": 1,
    "name_mara": "Кітап- алтын қазына",
    "type_mara": "Кітап оқу марафоны",
    "date": "22.01- 1.02",
    "gift": "Меломан дүкендер желісінен кітап",
    "photo": "assets/images/marathones/img.png",
  },
];

class MaraphoneListWidget extends StatefulWidget {
  const MaraphoneListWidget({Key? key}) : super(key: key);

  @override
  MaraphoneListWidgetState createState() => MaraphoneListWidgetState();
}

class MaraphoneListWidgetState extends State<MaraphoneListWidget> {
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
              itemCount: marathone.length,
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ChannelList(hobby: hobby[index]),
                    //   ),
                    // );
                  },
                  key: ValueKey(marathone[index]["id"]),
                  child: Stack(
                    children: [
                      Image.asset(marathone[index]["photo"], fit: BoxFit.fill),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              marathone[index]["name_mara"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                            Text(
                              marathone[index]["type_mara"],
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.white),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  marathone[index]["date"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.card_giftcard_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  marathone[index]["gift"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Icon(
                                  Icons.telegram,
                                  color: Colors.white,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
