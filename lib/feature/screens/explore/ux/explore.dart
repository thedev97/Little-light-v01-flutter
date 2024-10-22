import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_light_v01/core/constants/image_constants.dart';
import '../model/explore_model.dart';
import '../widgets/reel_item.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  ExploreScreenState createState() => ExploreScreenState();
}

class ExploreScreenState extends State<ExploreScreen> {
  final List<ExploreModel> _exploreCharities = [
    ExploreModel(
      name: 'Pink Hope Foundation',
      fundraisingGoal: 'Help us raise \$8,000',
      videoUrl: LLCImageConstant.charityReels3,
    ),
    ExploreModel(
      name: 'Empower Cancer Fighters',
      fundraisingGoal: 'Help us raise \$22,500',
      videoUrl: LLCImageConstant.charityReels4,
    ),
    ExploreModel(
      name: 'Nourish & Heal Foundation',
      fundraisingGoal: 'Help us raise \$10,000',
      videoUrl: LLCImageConstant.charityReels1,
    ),
    ExploreModel(
      name: 'Feed the Need Club',
      fundraisingGoal: 'Help us raise \$4,000',
      videoUrl: LLCImageConstant.charityReels2,
    ),
    ExploreModel(
      name: 'CareBridge Foundation',
      fundraisingGoal: 'Help us raise \$6000',
      videoUrl: LLCImageConstant.charityReels5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _exploreCharities.length,
          itemBuilder: (context, index) {
            return ReelItem(_exploreCharities[index]);
          },
        ),
      ),
    );
  }
}
