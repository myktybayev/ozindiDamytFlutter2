import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ozindi_damyt/features/podcast/data/database_helper.dart';

class AddPodcast extends StatefulWidget {
  const AddPodcast({Key? key}) : super(key: key);

  @override
  State<AddPodcast> createState() => _AddPodcastState();
}

class _AddPodcastState extends State<AddPodcast> {
  final _nameController = TextEditingController();
  Uint8List? _imageBytes;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _imageBytes = await pickedFile.readAsBytes();
      setState(() {});
    }
  }

  void _saveData() async {
    final name = _nameController.text;

    if (_imageBytes != null) {
      int insertId = await DatabaseHelper.insertCard(_imageBytes!, name);
      print(insertId);
    } else {
      print('Please pick an image before saving.');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.done, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  child: _imageBytes != null
                      ? Image.memory(
                          _imageBytes!,
                          fit: BoxFit.cover,
                          color: Colors.grey,
                        )
                      : Image.asset(
                          'assets/images/image.png',
                          fit: BoxFit.cover,
                          color: Colors.grey,
                        ),
                ),
                ElevatedButton(
                  onPressed: _getImage,
                  child: Text('Pick Image'),
                ),
                if (_imageBytes != null) Image.memory(_imageBytes!),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(hintText: 'Title'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(onPressed: _saveData, child: Text('Save')),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
