import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';
import 'package:ozindi_damyt/features/stoury/db/database.dart';
import 'package:ozindi_damyt/features/stoury/presentation/info_page.dart';

class StouryPage extends StatefulWidget {
  const StouryPage({Key? key}) : super(key: key);

  @override
  _StouryPageState createState() => _StouryPageState();
}

class _StouryPageState extends State<StouryPage> {
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _autorController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  void _showForm(int? id) async {
    if (id != null) {
      final existingJournal =
          _journals.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      _descriptionController.text = existingJournal['description'];
      _autorController.text = existingJournal['autor'];
      _linkController.text =
          existingJournal['photoLink'] ?? ''; // Add this line
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          // this will prevent the soft keyboard from covering the text fields
          bottom: MediaQuery.of(context).viewInsets.bottom + 120,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _autorController,
              decoration: const InputDecoration(hintText: 'Autor'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _linkController,
              decoration: const InputDecoration(hintText: 'Photo Link'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  await _addItem();
                }

                if (id != null) {
                  await _updateItem(id);
                }

                _titleController.text = '';
                _descriptionController.text = '';
                _autorController.text = '';
                _linkController.text = ''; // Add this line

                Navigator.of(context).pop();
              },
              child: Text(id == null ? 'Create New' : 'Update'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _addItem() async {
    try {
      await SQLHelper.createItem(
        _titleController.text,
        _descriptionController.text,
        _autorController.text,
        _linkController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Item added successfully!'),
        duration: const Duration(seconds: 10),
      ));
    } catch (error) {
      print('Error adding item: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to add item. Error: $error'),
        duration: const Duration(seconds: 10),
      ));
    }

    _refreshJournals();
  }

  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id,
        _titleController.text,
        _descriptionController.text,
        _autorController.text,
        _linkController.text);
    _refreshJournals();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: const Text('Ғибратты әңгімелер'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _journals.length,
              itemBuilder: (context, index) => Card(
                color: Colors.white54,
                margin: const EdgeInsets.all(15),
                child: Container(
                  height: 80,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoPage(
                            title: _journals[index]['title'] ?? '',
                            description: _journals[index]['description'] ?? '',
                            autor: _journals[index]['autor'] ?? '',
                            photoLink: _journals[index]['photoLink'] ?? '',
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Container(
                          width: 65,
                          height: 65,
                          child: _journals[index]['photoLink'] != null
                              ? Container(
                                  width: 60,
                                  height: 60,
                                  child: Image.network(
                                      _journals[index]['photoLink']))
                              : SizedBox.shrink(),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 150,
                          height: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _journals[index]['title'] ?? '',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                  width: 50,
                                  height: 30,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text("4.9"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _showForm(_journals[index]['id']),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteItem(_journals[index]['id']),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/icons/next.png"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
