import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_light_v01/core/constants/image_constants.dart';
import '../../../../core/widgets/custom_painter/dotted_border.dart';

class DonationPocketCard extends StatelessWidget {
  const DonationPocketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8, bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0XFFf9f9f1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black38),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFfef6e9),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black38),
        ),
        child: Row(
          children: [
            Stack(alignment: Alignment.center,
              children: [
              SizedBox(
                width: 50,height: 50,
                child: CustomPaint(
                  painter:  DottedBorder(numberOfStories: 14,spaceLength: 4),
                ),),
                Container(
                  height: 38, width: 38,
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFd0dead),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black38),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Image.asset(LLCImageConstant.dollar),
                ),
            ],),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Donation Pocket',
                  style: GoogleFonts.girassol(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '\$ 350,128.00',
                  style: GoogleFonts.girassol(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black38),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(Icons.arrow_forward, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}