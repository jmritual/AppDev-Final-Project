import 'package:flutter/material.dart';
import 'package:libraryz/library_view.dart';
import 'home_view.dart';
import 'category_view.dart';
import 'profile_view.dart';

class LibraryEBook extends StatefulWidget {
  const LibraryEBook({super.key});

  @override
  _LibraryEBookState createState() => _LibraryEBookState();
}

class _LibraryEBookState extends State<LibraryEBook> {
  int _currentIndex = 0;
  List<Map> selectedBooks = [];

  final List<Widget> _children = [];

  @override
  void initState() {
    super.initState();
    _children.addAll([
      Home(
        onAddBook: (book) {
          setState(() {
            if (!selectedBooks.contains(book)) {
              selectedBooks.add(book);
            }
          });
        },
      ),
      const Category(),
      LibraryView(selectedBooks: selectedBooks),
      const ProfileView(),
    ]);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
