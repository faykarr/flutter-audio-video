import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Music extends StatelessWidget {
  Music({super.key});
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Perfect - Ed Sheeran'),
              const SizedBox(height: 20.0),
              const Image(image: AssetImage('assets/images/ed-sheeran.jpg')),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  await _audioPlayer.play(AssetSource('musics/ed-sheeran-perfect.mp3'));
                },
                child: const Text('Play'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _audioPlayer.pause();
                },
                child: const Text('Pause'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _audioPlayer.resume();
                },
                child: const Text('Resume'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _audioPlayer.stop();
                },
                child: const Text('Stop'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
