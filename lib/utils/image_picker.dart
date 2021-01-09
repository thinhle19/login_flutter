import 'dart:io';

import "package:flutter/material.dart";
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/services/uploader.dart';

class ImageCapture extends StatefulWidget {
  static const routeName = '/image picker';
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File _image;
  Future<void> _pickImage(ImageSource imageSource) async {
    File selected = await ImagePicker.pickImage(source: imageSource);
    setState(() {
      _image = selected;
    });
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _image.path,
      ratioX: 1.0,
      ratioY: 1.0,
    );
    setState(() {
      _image = cropped ?? _image;
    });
  }

  void _clear() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => _pickImage(ImageSource.gallery),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          if (_image != null) ...[
            Image.file(_image),
            Row(
              children: [
                FlatButton(
                  child: Icon(Icons.crop),
                  onPressed: _cropImage,
                ),
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                )
              ],
            ),
            Uploader(file: _image),
          ],
        ],
      ),
    );
  }
}
