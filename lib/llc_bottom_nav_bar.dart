import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LLCBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const LLCBottomNavBar(
      {super.key, required this.currentIndex, required this.onTabTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 20, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.black38)),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          child: BottomAppBar(
            color: const Color(0xFF6dbdc4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  label: 'Home',
                  icon: Icons.dashboard,
                  isActive: currentIndex == 0,
                  onTap: () => onTabTapped(0),
                ),
                _buildNavItem(
                  label: 'Explore',
                  icon: Icons.explore,
                  isActive: currentIndex == 1,
                  onTap: () => onTabTapped(1),
                ),
                _buildNavItem(
                  label: 'Bookmark',
                  icon: Icons.bookmark,
                  isActive: currentIndex == 2,
                  onTap: () => onTabTapped(2),
                ),
                _buildNavItem(
                  label: 'Mail',
                  icon: Icons.mail,
                  isActive: currentIndex == 3,
                  onTap: () => onTabTapped(3),
                ),
                _buildNavItem(
                  label: 'Profile',
                  icon: Icons.person,
                  isActive: currentIndex == 4,
                  onTap: () => onTabTapped(4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String label,
    required IconData icon,
    required bool isActive,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
            color: isActive ? const Color(0xFFb1d774) : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
                color: isActive ? Colors.black38 : Colors.transparent)),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.black : Colors.white,
              size: isActive ? 20.0 : 25.0,
            ),
            if (isActive)
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(label,
                    style: GoogleFonts.girassol(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
              ),
          ],
        ),
      ),
    );
  }
}
