import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_light_v01/core/constants/image_constants.dart';

class LLCAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LLCAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(2.0),
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
            child: CircleAvatar(
              backgroundImage: AssetImage(LLCImageConstant.profile),
            ),
          ),
          Row(
            children: [
              _buildIconButton(
                icon: Icons.search,
                onPressed: () {},
              ),
              const SizedBox(width: 10),
              _buildIconButton(
                icon: Icons.notifications,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black38),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.black),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class LLCCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LLCCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildAppbarIconButton(
                  icon: Icons.arrow_back,
                  onPressed: () => Navigator.pop(context)),
              const SizedBox(width: 12),
              Text(
                'Details',
                style: GoogleFonts.girassol(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          _buildAppbarIconButton(icon: Icons.bookmark_border, onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildAppbarIconButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black38),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.black),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
