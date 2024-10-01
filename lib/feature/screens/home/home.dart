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
    return const SafeArea(
      child: Scaffold(
        appBar: LLCAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleSection(),
              SizedBox(height: 20),
              DonationPocketCard(),
              SizedBox(height: 20),
              CategoriesList(),
              SizedBox(height: 20),
              UrgentFundraisingList(),
            ],
          ),
        ),
      ),
    );
  }
}