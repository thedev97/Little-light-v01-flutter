import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Bookmark',
        style: GoogleFonts.girassol(
          fontSize: 24,
        ),
      ),
    );
  }
}
