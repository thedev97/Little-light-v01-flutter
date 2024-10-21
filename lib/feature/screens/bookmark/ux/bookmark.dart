import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  BookmarkScreenState createState() => BookmarkScreenState();
}

class  extends State<BookmarkScreen>
    with SingleTickerProviderStateMixin {

  final List<Map<String, String>> bookmarks = [
    {'title': 'Support Education for Gaza', 'description': 'Help us raise funds for Gaza!'},
    {'title': 'Support Health Initiatives', 'description': 'Donate for health campaigns'},
    {'title': 'Help Build Homes', 'description': 'Help us build homes for families in need'}
  ];

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bookmarks', style: GoogleFonts.girassol(fontSize: 24)),
        ),
        body: ListView.builder(
          itemCount: bookmarks.length,
          itemBuilder: (context, index) {
            final bookmark = bookmarks[index];
            return SlideTransition(
              position: _slideAnimation,
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookmark['title']!,
                        style: GoogleFonts.girassol(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        bookmark['description']!,
                        style: GoogleFonts.girassol(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Save button
                          IconButton(
                            icon: const Icon(Icons.bookmark_add_outlined),
                            onPressed: () {
                              showSnackBar(context, 'Post saved!');
                            },
                          ),
                          const SizedBox(width: 10),
                          // Delete button
                          IconButton(
                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                bookmarks.removeAt(index);
                              });
                              showSnackBar(context, 'Post deleted!');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
