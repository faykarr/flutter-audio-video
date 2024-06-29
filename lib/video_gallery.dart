// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:video_player/video_player.dart';

class VideoGallery extends StatefulWidget {
  const VideoGallery({super.key});

  @override
  State<VideoGallery> createState() => _VideoGalleryState();
}

class _VideoGalleryState extends State<VideoGallery> {
  File? _videoGallery;
  ImagePicker videoPicker = ImagePicker();
  VideoPlayerController? _videoPlayerController;
  XFile? pickedFile;

  _pickVideo() async {
    pickedFile = await videoPicker.pickVideo(source: ImageSource.gallery);
    _videoGallery = File(pickedFile!.path);
    _videoPlayerController = VideoPlayerController.file(_videoGallery!)
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
                if (_videoGallery != null)
                  _videoPlayerController!.value.isInitialized
                      ? AspectRatio(
                          aspectRatio:
                              _videoPlayerController!.value.aspectRatio,
                          child: VideoPlayer(_videoPlayerController!),
                        )
                      : Container()
                else
                  const Text(
                    "Click on Pick Video to select a video",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ElevatedButton(
                  onPressed: () async {
                    await _pickVideo();
                  },
                  child: const Text("Pick Video from Gallery"),
                ),
                if (_videoGallery != null)
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
