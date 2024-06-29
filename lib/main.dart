import 'package:audio_video_flutter/image_camera.dart';
import 'package:audio_video_flutter/image_gallery.dart';
import 'package:audio_video_flutter/music.dart';
import 'package:audio_video_flutter/offline_video.dart';
import 'package:audio_video_flutter/youtube_video.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Multimedia Practice'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.queue_music),
                  text: 'Musics',
                ),
                Tab(
                  icon: Icon(Icons.video_library),
                  text: 'Offline\nVideo',
                ),
                Tab(
                  icon: Icon(Icons.live_tv),
                  text: 'Youtube\nVideo',
                ),
                Tab(
                  icon: Icon(Icons.image),
                  text: 'Image\nGallery',
                ),
                Tab(
                  icon: Icon(Icons.camera),
                  text: 'Image\nCamera',
                ),
                Tab(
                  icon: Icon(Icons.video_camera_back),
                  text: 'Video\nGallery',
                ),
                Tab(
                  icon: Icon(Icons.video_camera_front),
                  text: 'Video\nCamera',
                ),
              ],
              indicatorColor: Colors.amber,
            ),
          ),
          body:  SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: TabBarView(
              children: [
                Music(),
                const OfflineVideo(),
                YoutubeVideo(),
                const ImageGallery(),
                const ImageCamera(),
                const Placeholder(),
                const Placeholder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
