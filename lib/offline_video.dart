import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class OfflineVideo extends StatefulWidget {
  const OfflineVideo({super.key});

  @override
  State<OfflineVideo> createState() => _OfflineVideoState();
}

class _OfflineVideoState extends State<OfflineVideo> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    _controller = VideoPlayerController.asset('assets/videos/videos.mp4');
    _initializeVideoPlayerFuture = _controller!.initialize();
    _controller!.setLooping(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text("Play Videos Offline"),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_controller!.value.isPlaying) {
                      _controller!.pause();
                    } else {
                      _controller!.play();
                    }
                  });
                },
                child: Icon(
                  _controller!.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _controller!.seekTo(const Duration(seconds: 0));
                  });
                },
                child: const Icon(Icons.replay),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
