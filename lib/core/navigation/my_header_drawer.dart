import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatelessWidget {
  const MyHeaderDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white54, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 7,
          offset: Offset(0, 1),
        )
      ]),
      height: 107,
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 25, left: 5),
            height: 51,
            width: 51,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/9131/9131529.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 22,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              const Text(
                'Username',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const Text(
                'user@gmail.com',
                style: TextStyle(fontSize: 13),
              )
            ],
          )
        ],
      ),
    );
  }
}
