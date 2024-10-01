import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Explore',
        style: GoogleFonts.girassol(
          fontSize: 24,
        ),
      ),
    );
  }
}
