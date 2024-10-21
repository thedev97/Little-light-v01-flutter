import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_light_v01/feature/screens/home/mobx/category_store.dart';

import '../../../../core/widgets/category_item.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
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
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Observer(
                builder: (_) => CampaignCategoryItem(
                  title: 'Donation',
                  icon: Icons.volunteer_activism,
                  isSelected: categoryStore.selectedIndex == 0,
                  onTap: () => categoryStore.selectCategory(0),
                ),
              ),
              Observer(
                builder: (_) => CampaignCategoryItem(
                  title: 'Education',
                  icon: Icons.school,
                  isSelected: categoryStore.selectedIndex == 1,
                  onTap: () => categoryStore.selectCategory(1),
                ),
              ),
              Observer(
                builder: (_) => CampaignCategoryItem(
                  title: 'Medical',
                  icon: Icons.local_hospital,
                  isSelected: categoryStore.selectedIndex == 2,
                  onTap: () => categoryStore.selectCategory(2),
                ),
              ),
              Observer(
                builder: (_) => CampaignCategoryItem(
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
