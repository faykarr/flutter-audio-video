import 'package:audio_video_flutter/music.dart';
import 'package:audio_video_flutter/offline_video.dart';
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
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Multimedia Practice'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.queue_music),
                  text: 'Music',
                ),
                Tab(
                  icon: Icon(Icons.video_library),
                  text: 'Offline Video',
                ),
                Tab(
                  icon: Icon(Icons.live_tv),
                  text: 'Youtube Video',
                ),
              ],
            ),
          ),
          body:  SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: TabBarView(
              children: [
                Music(),
                OfflineVideo(),
                Placeholder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
