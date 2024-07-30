import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: const CategoryPage(),
    );
  }
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<Map<String, String>> categories = [
    {"name": "Science Fiction", "color": "0xFF42A5F5", "img": "assets/img/b6.jpg"},
    {"name": "Romance", "color": "0xFFFF4081", "img": "assets/img/b5.jpg"},
    {"name": "Thriller", "color": "0xFFAB47BC", "img": "assets/img/b4.jpg"},
    {"name": "Non-fiction", "color": "0xFF66BB6A", "img": "assets/img/b3.jpg"},
    {"name": "Mystery", "color": "0xFFEF5350", "img": "assets/img/b2.jpg"},
    {"name": "Fantasy", "color": "0xFFFFA726", "img": "assets/img/b1.jpg"},
    {"name": "Biography", "color": "0xFF29B6F6", "img": "assets/img/p1.jpg"},
    {"name": "Children's", "color": "0xFFFF7043", "img": "assets/img/p2.jpg"},
    {"name": "History", "color": "0xFF8D6E63", "img": "assets/img/p3.jpg"},
    {"name": "Adventure", "color": "0xFFD4E157", "img": "assets/img/h1.jpg"},
  ];

  late List<Map<String, String>> filteredCategories;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCategories = categories;
    searchController.addListener(() {
      filterCategories();
    });
  }

  void filterCategories() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredCategories = categories.where((category) {
        return category['name']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search categories',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: filteredCategories.length,
            itemBuilder: (ctx, i) => CategoryItem(
              name: filteredCategories[i]['name']!,
              color: Color(int.parse(filteredCategories[i]['color']!)),
              imgPath: filteredCategories[i]['img']!,
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String name;
  final Color color;
  final String imgPath;

  const CategoryItem({super.key, 
    required this.name,
    required this.color,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    imgPath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}