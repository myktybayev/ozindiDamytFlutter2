import 'package:flutter/material.dart';
import 'package:ozindi_damyt/features/stoury/data/student.dart';

class BuildAngimeList extends StatefulWidget {
  final List<Map<String, dynamic>> journals;

  BuildAngimeList({required this.journals});

  @override
  State<BuildAngimeList> createState() => _BuildAngimeListState();
}

class _BuildAngimeListState extends State<BuildAngimeList> {
  late List<Map<String, dynamic>> _journals;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _journals = widget.journals;
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: _journals.length,
            itemBuilder: (context, index) {
              Student angime = Student.fromMap(_journals[index]);
              return InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => InfoPage(angime),
                  //   ),
                  // );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 125,
                          height: 100,
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Image.network(angime.photoLink),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                angime.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "4.5",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          child: Icon(Icons.arrow_forward_outlined),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
