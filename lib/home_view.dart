import 'package:flutter/material.dart';
import 'book_detail_view.dart';
import 'book_edu_info.dart';
import 'book_en_info.dart';
import 'book_rec_info.dart';

class Home extends StatelessWidget {
  final Function(Map) onAddBook;

  Home({Key? key, required this.onAddBook});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search TextField
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
              ),
            ),
            // Recently Added Section
            const SectionTitle(title: "Recently Added"),
            HorizontalBookList(
              bookList: recentlyAddedArr,
              onAdd: onAddBook,
            ),
            // Education Section
            const SectionTitle(title: "Education"),
            HorizontalBookList(
              bookList: educMaterialArr,
              onAdd: onAddBook,
            ),
            // Entertainment Section
            const SectionTitle(title: "Entertainment"),
            HorizontalBookList(
              bookList: entertainMaterialArr,
              onAdd: onAddBook,
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for section titles
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for horizontal book lists
class HorizontalBookList extends StatelessWidget {
  final List<Map<String, dynamic>> bookList;
  final Function(Map) onAdd;

  const HorizontalBookList({Key? key, required this.bookList, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310, // Increased height to accommodate text
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          var book = bookList[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailView(bObj: book), // Navigate to book detail view
                ),
              );
            },
            child: RecentlyAddedCell(
              rObj: book,
              onAdd: onAdd,
            ),
          );
        },
      ),
    );
  }
}

// Widget for each recently added book cell
class RecentlyAddedCell extends StatefulWidget {
  final Map<String, dynamic> rObj;
  final Function(Map) onAdd;

  const RecentlyAddedCell({Key? key, required this.rObj, required this.onAdd}) : super(key: key);

  @override
  _RecentlyAddedCellState createState() => _RecentlyAddedCellState();
}

class _RecentlyAddedCellState extends State<RecentlyAddedCell> {
  bool _isBookmarked = false;

  // Toggle bookmark status and call onAdd callback
  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
    widget.onAdd(widget.rObj);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: media.width * 0.35, // Adjusted width to give more space to text
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Book cover image
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.rObj["img"].toString(),
                    width: media.width * 0.35,
                    height: media.width * 0.50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Book title
              Expanded(
                child: Text(
                  widget.rObj["name"].toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // Book author
              Expanded(
                child: Text(
                  widget.rObj["author"].toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          // Bookmark icon with toggle functionality
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: _toggleBookmark,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: _isBookmarked ? Colors.blue : Colors.grey.withOpacity(0.6),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(1, 3),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.bookmark_add_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
