import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_light_v01/feature/screens/home/mobx/category_store.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  CategoriesListState createState() => CategoriesListState();
}

class CategoriesListState extends State<CategoriesList> {
  final CategoryStore categoryStore = CategoryStore();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: GoogleFonts.girassol(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Observer(
                builder: (_) => CategoryItem(
                  title: 'Donation',
                  icon: Icons.volunteer_activism,
                  isSelected: categoryStore.selectedIndex == 0,
                  onTap: () => categoryStore.selectCategory(0),
                ),
              ),
              Observer(
                builder: (_) => CategoryItem(
                  title: 'Education',
                  icon: Icons.school,
                  isSelected: categoryStore.selectedIndex == 1,
                  onTap: () => categoryStore.selectCategory(1),
                ),
              ),
              Observer(
                builder: (_) => CategoryItem(
                  title: 'Medical',
                  icon: Icons.local_hospital,
                  isSelected: categoryStore.selectedIndex == 2,
                  onTap: () => categoryStore.selectCategory(2),
                ),
              ),
              Observer(
                builder: (_) => CategoryItem(
                  title: 'Handicapped',
                  icon: Icons.accessible,
                  isSelected: categoryStore.selectedIndex == 3,
                  onTap: () => categoryStore.selectCategory(3),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFB2D659) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black38),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: Colors.black),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: GoogleFonts.girassol(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
