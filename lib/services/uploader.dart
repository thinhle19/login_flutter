import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Uploader extends StatefulWidget {
  final File file;

  Uploader({this.file});

  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://login-1cc86.appspot.com/');
  StorageUploadTask _uploadTask;

  void _startUpload() {
    String path = 'images/${DateTime.now().toString()}.png';
    setState(() {
      _uploadTask = _storage.ref().child(path).putFile(widget.file);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
        stream: _uploadTask.events,
        builder: (context, snapshot) {
          var event = snapshot?.data?.snapshot;
          double progressPercent =
              event != null ? event.bytesTransferred / event.totalByteCount : 0;
          return Column(
            children: [
              if (_uploadTask.isComplete) Text('🎇🎇🎇'),
              if (_uploadTask.isInProgress)
                FlatButton(
                  child: Icon(Icons.pause),
                  onPressed: _uploadTask.pause,
                ),
              if (_uploadTask.isPaused)
                FlatButton(
                  child: Icon(Icons.play_arrow),
                  onPressed: _uploadTask.resume,
                ),
              LinearProgressIndicator(value: progressPercent),
              Text('${(progressPercent * 100)} %'),
            ],
          );
        },
      );
    } else {
      return FlatButton.icon(
        label: Text('Upload to firebase'),
        icon: Icon(Icons.cloud_upload),
        onPressed: _startUpload,
      );
    }
  }
}
