// Import the material design package for Flutter components and styling.
import 'package:flutter/material.dart';

class LibraryView extends StatelessWidget {
  // Define a final list of books, each represented as a Map.
  final List<Map> selectedBooks;

  // Constructor to initialize the list of selected books.
  const LibraryView({super.key, required this.selectedBooks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar displays the title of the page.
      appBar: AppBar(
        title: const Text('Library'),
      ),
      // Body content of the Scaffold.
      body: selectedBooks.isEmpty
          // Display a message if no books are selected.
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Your Library is Empty!',
                  style: TextStyle(
                    color: Colors.black, // Standard text color.
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          // Display the list of books if there are any.
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: selectedBooks.length,
              itemBuilder: (context, index) {
                // Retrieve the current book's data.
                var book = selectedBooks[index];
                return Card(
                  elevation: 4, // Add a shadow to the card for better visual separation.
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    // Display the book's image or a default icon if the image is missing.
                    leading: book["img"] != null
                        ? Image.asset(
                            book["img"].toString(),
                            fit: BoxFit.cover,
                            width: 60,
                            height: 90,
                          )
                        : const Icon(Icons.book, size: 60, color: Colors.black),

                    title: Text(
                      book["name"].toString(),
                      style: const TextStyle(
                        color: Colors.black, // Standard text color.
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Display the book's author.
                    subtitle: Text(
                      book["author"].toString(),
                      style: const TextStyle(
                        color: Colors.grey, // Standard subtitle color.
                        fontSize: 14,
                      ),
                    ),
                    // Add a trailing icon for potential interactions or navigation.
                    trailing: const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black),
                    onTap: () {
                      // Handle the tap event (example it will navigate to book details or book).
                    },
                  ),
                );
              },
            ),
    );
  }
}
