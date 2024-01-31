import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddAngimePage extends StatefulWidget {
  AddAngimePage({super.key});

  @override
  State<AddAngimePage> createState() => _AddAngimePageState();
}

class _AddAngimePageState extends State<AddAngimePage> {
  File? file;
  ImagePicker image = ImagePicker();

  //late Future<List<Angime>> _angimeList;

  @override
  void initState() {
    super.initState();
    updateAngimeList();
  }

  updateAngimeList() {
    setState(() {
      //_angimeList = DBProvider.db.getStudents();
    });
  }

  final _nameController = TextEditingController();
  final _autorNameController = TextEditingController();
  final _stouryController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _autorNameController.dispose();
    _stouryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add angime"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: "Name of stoury",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _autorNameController,
              decoration: InputDecoration(
                  labelText: "Author of stoury",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _stouryController,
              decoration: InputDecoration(
                  labelText: "Type stoury",
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 1.0)),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))),
              maxLines: 5,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 140,
                width: 180,
                child: file == null
                    ? Icon(
                        Icons.image,
                        size: 50,
                      )
                    : Image.file(file!, fit: BoxFit.fill)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomElevatedButton(
                  onPressed: () {
                    getgal();
                  },
                  text: 'Take photo from gallery',
                ),
                CustomElevatedButton(
                  onPressed: () {
                    getcam();
                  },
                  text: 'Take photo from camera',
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  _saveForm();
                },
                child: Text("Save"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    textStyle: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }

  getgal() async {
    try {
      var img = await image.getImage(source: ImageSource.gallery);
      setState(() {
        file = File(img!.path);
      });
    } catch (e) {
      print("Error getting image from gallery: $e");
    }
  }

  getcam() async {
    try {
      var img = await image.getImage(source: ImageSource.camera);
      setState(() {
        file = File(img!.path);
      });
    } catch (e) {
      print("Error getting image from gallery: $e");
    }
  }

  void _saveForm() {
    print("Name : ${_nameController.text}");
    print("Name : ${_autorNameController.text}");
    print("Name : ${_stouryController.text}");
    // angimeList.add(Angime(
    //   photo: 'lib/photos/image1.png',
    //   desc: _autorNameController.text,
    //   name: _nameController.text,
    //   city: "Taraz",
    // ));
    // setState(() {});
  }
}

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
          style: ElevatedButton.styleFrom(
              primary: Colors.green,
              textStyle: TextStyle(color: Colors.white))),
    );
  }
}
