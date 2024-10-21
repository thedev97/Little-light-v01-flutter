import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';  // For playing videos

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<String> reelData = [
    'assets/reel1.mp4',
    'assets/reel2.mp4',
    'assets/reel3.mp4',
  ];  // Replace with video paths or URLs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: reelData.length,
        itemBuilder: (context, index) {
          return ReelItem(reelData[index]);
        },
      ),
    );
  }
}

class ReelItem extends StatefulWidget {
  final String videoUrl;

  ReelItem(this.videoUrl);

  @override
  _ReelItemState createState() => _ReelItemState();
}

class _ReelItemState extends State<ReelItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});  // To rebuild once video is initialized
        _controller.play();  // Auto-play the video
        _controller.setLooping(true);  // Loop the video
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Center(child: CircularProgressIndicator()),

        // Add overlay for charity information or action buttons here
        Positioned(
          bottom: 20,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Charity details or actions (e.g., Donate button)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Charity Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Help us raise \$5000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  // Action for liking the reel
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
