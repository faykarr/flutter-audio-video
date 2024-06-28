# Audio & Video Flutter
## 1. Introduction
This is a simple Flutter project that demonstrates how to play audio and video files in Flutter. The project uses the following plugins:
- [audioplayers](https://pub.dev/packages/audioplayers) for playing audio files.
- [video_player](https://pub.dev/packages/video_player) for playing video files.

## 2. Getting Started
### 2.1. Dependencies
Add the following dependencies in your `pubspec.yaml` file:
```yaml
dependencies:
  flutter:
    sdk: flutter
  audioplayers: ^0.20.1
  video_player: ^2.1.6
```

### 2.2. Assets
Add the audio and video files in the `assets` folder of your project.

### 2.3. Code
- Import the required libraries:
```dart
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';
```

- Play audio:
```dart
AudioPlayer audioPlayer = AudioPlayer();
audioPlayer.play('assets/audio.mp3', isLocal: true);
```

- Play video:
```dart
VideoPlayerController videoPlayerController = VideoPlayerController.asset('assets/video.mp4');
videoPlayerController.initialize().then((_) {
  videoPlayerController.play();
});
```

## 3. Conclusion
This project demonstrates how to play audio and video files in Flutter using the `audioplayers` and `video_player` plugins. You can find the complete source code [here](https://github.com/faykarr/flutter-audio-video).

## 4. References
- [audioplayers](https://pub.dev/packages/audioplayers)
- [video_player](https://pub.dev/packages/video_player)