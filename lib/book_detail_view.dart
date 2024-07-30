import 'package:flutter/material.dart';
import 'package:libraryz/book_reading_view.dart';

class BookDetailView extends StatelessWidget {
  final Map<String, dynamic> bObj;  // Use a more specific type for better type safety

  const BookDetailView({super.key, required this.bObj});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          bObj["name"],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book Cover Image
            Center(
              child: Container(
                width: 150,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(bObj["img"].toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Book Title and Author
            Center(
              child: Column(
                children: [
                  Text(
                    bObj["name"],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8 ),
                  Text(
                    bObj["author"],
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8 ),
                  Text(
                    bObj["category"] ?? 'Unknown Category',  // Display the category here
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8 ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookReadingView(bObj: bObj),
                        ),
                      );
                    },
                    icon: Icon(Icons.book),
                    label: const Text("Read"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16 ),
            Text(
              "Synopsis",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8 ),

            // Book Description
            Text(
              bObj["synopsis"] ?? 'No synopsis available', // Handle potential null value
              style: TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.justify,
              maxLines: null,  // Allow the text to wrap and expand as needed
              overflow: TextOverflow.visible,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}