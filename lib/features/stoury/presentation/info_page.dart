import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class InfoPage extends StatefulWidget {
  final String title;
  final String description;
  final String autor;
  final String? photoLink;

  InfoPage({
    required this.title,
    required this.description,
    required this.autor,
    this.photoLink,
  });

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Photo with background
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Background color
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: widget.photoLink != null
                    ? Image.network(
                        widget.photoLink!,
                        width: double.infinity,
                        height: 200, // Adjust the height as needed
                        fit: BoxFit.cover,
                      )
                    : SizedBox.shrink(),
              ),
              const SizedBox(height: 16),
              // Title with bold style
              Text(
                'Title: ${widget.title}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Author
              Text('Author: ${widget.autor}', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              // Description
              Text('Description: ${widget.description}',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              // Rating bar
              Column(
                children: [
                  Text(
                    "Rating $rating",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RatingBar.builder(
                    minRating: 1,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        this.rating = rating;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
