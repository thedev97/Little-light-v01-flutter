import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/widgets/custom_widget.dart';
import '../mobx/bookmark_store.dart';
import '../widgets/button.dart';

class BookmarkScreen extends StatelessWidget {
  final BookmarkStore _bookmarkStore = BookmarkStore();
  final BookmarkButton _bookmarkButton = BookmarkButton();

  BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bookmark', style: GoogleFonts.girassol(fontSize: 24)),
        ),
        body: Observer(
          builder: (_) => ListView.builder(
            itemCount: _bookmarkStore.bookmarks.length,
            itemBuilder: (context, index) {
              final bookmark = _bookmarkStore.bookmarks[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFfef6e9).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          bookmark['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: -5.0, sigmaY: 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bookmark['title']!,
                            style: GoogleFonts.girassol(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            bookmark['description']!,
                            style: GoogleFonts.girassol(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _bookmarkButton.buildButton(
                                  icon: Icons.bookmark,
                                  onPressed: () =>
                                      showSnackBar(context, 'Post saved!')),
                              const SizedBox(width: 10),
                              _bookmarkButton.buildButton(
                                icon: Icons.delete,
                                onPressed: () {
                                  _bookmarkStore.removeBookmark(index);
                                  showSnackBar(context, 'Post deleted!');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
