import 'package:flutter/material.dart';
import '../model/explore_reel_model.dart';
import '../widgets/reel_item.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  ExploreScreenState createState() => ExploreScreenState();
}

class ExploreScreenState extends State<ExploreScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: exploreCharities.length,
          itemBuilder: (context, index) {
            return ReelItem(exploreCharities[index]);
          },
        ),
      ),
    );
  }
}
