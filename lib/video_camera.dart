// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:video_player/video_player.dart';

class VideoCamera extends StatefulWidget {
  const VideoCamera({super.key});

  @override
  State<VideoCamera> createState() => _VideoCameraState();
}

class _VideoCameraState extends State<VideoCamera> {
  File? _videoCamera;
  ImagePicker videoPicker = ImagePicker();
  VideoPlayerController? _videoPlayerController;
  XFile? pickedFile;

  _pickVideo() async {
    pickedFile = await videoPicker.pickVideo(source: ImageSource.camera);
    _videoCamera = File(pickedFile!.path);
    _videoPlayerController = VideoPlayerController.file(_videoCamera!)
      ..initialize().then(
            (value) {
          setState(() {});
          _videoPlayerController!.play();
        },
      );
  }

  _saveVideoToGallery() async {
    // Save image to gallery
    String fileDirectory = path.dirname(pickedFile!.path);
    var dt = DateTime.now();
    var bulan;
    if (dt.month < 10) {
      bulan = '0${dt.month}';
    } else {
      // statements
      bulan = dt.month;
    }
    var hari;
    if (dt.day < 10) {
      hari = '0${dt.day}';
    } else {
      // statements
      hari = dt.day;
    }
    var jam;
    if (dt.hour < 10) {
      jam = '0${dt.hour}';
    } else {
      // statements
      jam = dt.hour;
    }
    var detik;
    if (dt.second < 10) {
      detik = '0${dt.second}';
    } else {
      // statements
      detik = dt.second;
    }
    String newPath =
    path.join(fileDirectory, 'video_${dt.year}$bulan$hari$jam$detik.mp4');
    File newImage = File(pickedFile!.path).renameSync(newPath);
    if (pickedFile != null) {
      GallerySaver.saveVideo(newImage.path, albumName: 'Flutter Multimedia');
    }
    const snackBar = SnackBar(
      content: Text('Video saved to Gallery'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (_videoCamera != null)
                  _videoPlayerController!.value.isInitialized
                      ? AspectRatio(
                    aspectRatio:
                    _videoPlayerController!.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController!),
                  )
                      : Container()
                else
                  const Text(
                    "Click on Pick Video to take video from camera.",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ElevatedButton(
                  onPressed: () async {
                    await _pickVideo();
                  },
                  child: const Text("Pick Video from Camera"),
                ),
                if (_videoCamera != null)
                  ElevatedButton(
                    onPressed: () async {
                      await _saveVideoToGallery();
                    },
                    child: const Text("Save Video to Gallery"),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
