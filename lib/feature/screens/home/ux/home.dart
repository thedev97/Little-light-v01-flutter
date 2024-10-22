import 'package:flutter/material.dart';
import 'package:little_light_v01/core/widgets/llc_app_bar.dart';
import 'package:little_light_v01/feature/screens/home/ux/categories_list.dart';
import 'package:little_light_v01/feature/screens/home/ux/donation_pocket.dart';
import 'package:little_light_v01/feature/screens/home/ux/tile_section.dart';
import 'package:little_light_v01/feature/screens/home/ux/urgent_fund_raising.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const LLCAppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleSection(),
              const SizedBox(height: 20),
              const DonationPocketCard(),
              const SizedBox(height: 20),
              const CategoriesList(),
              const SizedBox(height: 20),
              UrgentFundraisingList(),
            ],
          ),
        ),
      ),
    );
  }
}