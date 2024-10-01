import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_light_v01/core/constants/image_constants.dart';

class UrgentFundraisingList extends StatelessWidget {
  const UrgentFundraisingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Urgent Fundraising',
          style: GoogleFonts.girassol(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              FundraisingCard(
                title: 'Support Education for Gaza',
                organization: 'Initiated by Health Organization',
                target: '\$120,000',
                progress: '40%',
                imagePath: LLCImageConstant.charity1,
              ),
              FundraisingCard(
                title: 'Urgent Healthcare Aid',
                organization: 'Initiated by Health Organization',
                target: '\$70,000',
                progress: '60%',
                imagePath: LLCImageConstant.charity2,
              ),
              FundraisingCard(
                title: 'Safe Haven for Kids',
                organization: 'Initiated by Safe Childhood Foundation',
                target: '\$50,000',
                progress: '70%',
                imagePath: LLCImageConstant.charity3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FundraisingCard extends StatelessWidget {
  final String title;
  final String organization;
  final String target;
  final String progress;
  final String imagePath;

  const FundraisingCard({
    super.key,
    required this.title,
    required this.organization,
    required this.target,
    required this.progress,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black38),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: GoogleFonts.girassol(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                organization,
                style: GoogleFonts.girassol(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Target $target',
                    style: GoogleFonts.girassol(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Text(progress,
                      style: GoogleFonts.girassol(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
