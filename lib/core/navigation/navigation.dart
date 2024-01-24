import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Ozindi Damyt'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            MyHeaderDrawer(),
            ListTile(
              title: Text('Кітапхана'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Ғибратты әңгімелер'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Подкаст'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Quizziz'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Марафон'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Профориентация'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Хобби'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Спорт'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Кино'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Жаңа ұсыныстар'),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
