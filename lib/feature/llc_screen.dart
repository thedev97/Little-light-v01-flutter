import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:little_light_v01/llc_bottom_nav_bar.dart';
import 'package:little_light_v01/feature/screens/home/ux/home.dart';
import 'package:little_light_v01/feature/screens/mail/ux/mail.dart';
import 'package:little_light_v01/feature/screens/profile/ux/profile.dart';
import 'package:little_light_v01/feature/screens/explore/ux/explore.dart';
import 'package:little_light_v01/feature/screens/bookmark/ux/bookmark.dart';
import 'package:little_light_v01/store/bottom_nav_store.dart';

final bottomNavStore = BottomNavStore();

class LLCScreen extends StatelessWidget {
  final List<Widget> _pages =  [
    const HomeScreen(),
    const ExploreScreen(),
    BookmarkScreen(),
    MailScreen(),
    ProfileScreen(),
  ];

  LLCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => _pages[bottomNavStore.currentIndex],
      ),
      bottomNavigationBar: Observer(
        builder: (_) => LLCBottomNavBar(
          currentIndex: bottomNavStore.currentIndex,
          onTabTapped: (index) {
            bottomNavStore.setIndex(index);
          },
        ),
      ),
    );
  }
}
