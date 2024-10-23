import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/constants/image_constants.dart';
import '../mobx/profile_store.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileStore _profileStore = ProfileStore();
  late List<VideoPlayerController> _controllers;

  final List<String> posts = [
    LLCImageConstant.charity1,
    LLCImageConstant.charity2,
    LLCImageConstant.charity3,
    LLCImageConstant.charity4,
    LLCImageConstant.charity5,
    LLCImageConstant.charity6,
  ];

  final List<String> reels = [
    LLCImageConstant.charityReels1,
    LLCImageConstant.charityReels2,
    LLCImageConstant.charityReels3,
    LLCImageConstant.charityReels4,
    LLCImageConstant.charityReels5,
  ];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(reels.length, (index) {
      final VideoPlayerController controller = VideoPlayerController.asset(reels[index]);
      controller.initialize().then((_) {
        setState(() {
        });
        controller.setLooping(true);
        controller.play();
      });
      return controller;
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile', style: GoogleFonts.girassol(fontSize: 24)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16,),
          child: Observer(
            builder: (_) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildProfileImage(),
                  const SizedBox(height: 16),
                  _buildProfileName(),
                  const SizedBox(height: 8),
                  _buildProfileEmail(),
                  const SizedBox(height: 8),
                  _buildProfileBio(),
                  const SizedBox(height: 14),
                  _editProfileButton(),
                  const SizedBox(height: 20),
                  _buildToggleButtons(sizeWidth),
                  const SizedBox(height: 16),
                  _profileStore.isPostsSelected
                      ? _buildCharityPostsGrid()
                      : _buildCharityReelsGrid(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
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
        radius: 52,
        backgroundImage: AssetImage(_profileStore.profileImage),
      ),
    );
  }

  Widget _buildProfileName() {
    return Text(
      _profileStore.name,
      style: GoogleFonts.girassol(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }

  Widget _buildProfileEmail() {
    return Text(
      _profileStore.email,
      style: GoogleFonts.girassol(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }

  Widget _buildProfileBio() {
    return Text(
      _profileStore.bio,
      textAlign: TextAlign.center,
      style: GoogleFonts.girassol(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: Colors.black87,
      ),
    );
  }

  Widget _editProfileButton() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFb3d77d),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: () {
          _profileStore.updateProfile(
            'Travis Marlin',
            'travisM97@icloud.com',
            LLCImageConstant.profile,
            'A passionate supporter of charity.',
          );
        },
        icon: const Icon(
          Icons.edit,
          color: Colors.black,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFb3d77d),
          padding: const EdgeInsets.all(11),
          side: const BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        label: Text(
          'Edit Profile',
          style: GoogleFonts.girassol(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButtons(double sizeWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPostsButton(),
        SizedBox(width: sizeWidth * 0.35),
        _buildReelsButton(),
      ],
    );
  }

  Widget _buildPostsButton() {
    return ElevatedButton(
      onPressed: () {
        _profileStore.selectPosts();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _profileStore.isPostsSelected ? const Color(0xFFeceaf7) : Colors.grey[300],
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        'Posts',
        style: GoogleFonts.girassol(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildReelsButton() {
    return ElevatedButton(
      onPressed: () {
        _profileStore.selectReels();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: !_profileStore.isPostsSelected ? const Color(0xFFfaf8e9) : Colors.grey[300],
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        'Reels',
        style: GoogleFonts.girassol(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildCharityPostsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.6,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final item = posts[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0XFF004d00),
            border: Border.all(color: Colors.black, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
            image: DecorationImage(
              image: AssetImage(item),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCharityReelsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.6,
      ),
      itemCount: reels.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: VideoPlayer(_controllers[index]),
          ),
        );
      },
    );
  }
}
