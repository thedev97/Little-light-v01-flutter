import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's share charity",
          style: GoogleFonts.girassol(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Good people love and help each other',
          style:  GoogleFonts.girassol(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}