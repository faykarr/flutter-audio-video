// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class ImageCamera extends StatefulWidget {
  const ImageCamera({super.key});

  @override
  State<ImageCamera> createState() => _ImageCameraState();
}

class _ImageCameraState extends State<ImageCamera> {
  File? _imageCamera;
  ImagePicker imagePicker = ImagePicker();
  XFile? pickedFile;

  _pickImageFromCamera() async {
    pickedFile = await imagePicker.pickImage(source: ImageSource.camera, imageQuality: 50);
    File image = File(pickedFile!.path);
    if (pickedFile != null) {
      setState(() {
        _imageCamera = image;
      });
    }
  }

  _saveImageToGallery() async {
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
        path.join(fileDirectory, 'image_camera_${dt.year}$bulan$hari$jam$detik.jpg');
    File newImage = File(pickedFile!.path).renameSync(newPath);
    if (pickedFile != null) {
      GallerySaver.saveImage(newImage.path, albumName: 'Flutter Multimedia');
    }
    const snackBar = SnackBar(
      content: Text('Image saved to Gallery'),
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
                if (_imageCamera != null)
                  Image.file(_imageCamera!)
                else
                  const Text(
                    "Click on Pick Image to take picture from Camera",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ElevatedButton(
                  onPressed: () async {
                    await _pickImageFromCamera();
                  },
                  child: const Text("Pick Image from Camera"),
                ),
                if (_imageCamera != null)
                  ElevatedButton(
                    onPressed: () async {
                      await _saveImageToGallery();
                    },
                    child: const Text("Save Image to Gallery"),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
