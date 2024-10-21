import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_light_v01/core/constants/image_constants.dart';
import 'package:little_light_v01/core/widgets/custom_progress_bar.dart';
import 'package:little_light_v01/core/widgets/mobx/progress_store.dart';

import '../../details/ux/details.dart';

class UrgentFundraisingList extends StatelessWidget {
  final ProgressStore store1 = ProgressStore();
  final ProgressStore store2 = ProgressStore();
  final ProgressStore store3 = ProgressStore();

  UrgentFundraisingList({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Urgent Fundraising',
              style: GoogleFonts.girassol(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(Icons.more_horiz, color: Color(0XFF898989),)
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: screenHeight * 0.29,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              FundraisingCard(
                title: 'Support Education for Gaza',
                organization: 'Initiated by Health Organization',
                target: '\$120,000',
                progress: 0.40,
                imagePath: LLCImageConstant.charity1,
                store: store1,
              ),
              FundraisingCard(
                title: 'Urgent Healthcare Aid',
                organization: 'Initiated by Health Organization',
                target: '\$70,000',
                progress: 0.60,
                imagePath: LLCImageConstant.charity2,
                store: store2,
              ),
              FundraisingCard(
                title: 'Safe Haven for Kids',
                organization: 'Initiated by Safe Childhood Foundation',
                target: '\$50,000',
                progress: 0.70,
                imagePath: LLCImageConstant.charity3,
                store: store3,
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
  final double progress;
  final String imagePath;
  final ProgressStore store;

  const FundraisingCard({
    super.key,
    required this.title,
    required this.organization,
    required this.target,
    required this.progress,
    required this.imagePath,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    store.updateProgress(progress);
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CampaignDetailsScreen(
                campaignTitle: title,
                organization: organization,
                target: target,
                imagePath: imagePath,
                raisedSoFar: (progress *
                    double.parse(
                        target.replaceAll('\$', '').replaceAll(',', ''))),
              ),
            ),
          );
        },
        child: Container(
          width: screenHeight * 0.3,
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
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Stack(
                      children: [
                        Image.asset(
                          imagePath,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: _buildSaveButton(
                            icon: Icons.bookmark,
                            onPressed: () => debugPrint('Save'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 2, left: 8, right: 8),
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
                    child: Row(
                      children: [
                        Image.asset(
                          LLCImageConstant.check,
                          height: 16,
                          width: 16,
                          color: const Color(0xFF8ea25b),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          organization,
                          style: GoogleFonts.girassol(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
                    child: CustomProgressBar(store: store),
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
                        Text(
                          '${(progress * 100).toStringAsFixed(0)}%',
                          style: GoogleFonts.girassol(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0XFF9ebebb),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: const Color(0XFFb8c6a5)),
      ),
    );
  }
}
