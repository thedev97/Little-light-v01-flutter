import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MailScreen extends StatelessWidget {
  const MailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Mail',
        style: GoogleFonts.girassol(
          fontSize: 24,
        ),
      ),
    );
  }
}
