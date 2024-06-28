import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideo extends StatelessWidget {
  YoutubeVideo({super.key});
  static String VideoID = 'kPhpHvnnn0Q';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: VideoID,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text("Play Videos from Youtube"),
            const SizedBox(
              height: 30,
            ),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}