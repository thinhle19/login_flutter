import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LocalStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localLoginFile async {
    final path = await _localPath;
    File file = File("$path/test.txt");
    final doesExist = await file.exists();

    if(!doesExist) file = await file.create();

    return file;
  }

  Future<File> login() async {
    try {
      final file = await _localLoginFile;

      // Write 'x' to file
      return await file.writeAsString('x');
    } catch (e) {
      // If encountering an error, return 0
      return null;
    }
  }

  Future<File> logout() async {
    final file = await _localLoginFile;
    // Write the file
    return file.writeAsString('');
  }

  Future<bool> checkState() async {
    try {
      final file = await _localLoginFile;
      return (await file.readAsString() == 'x') ? true : false;
    } catch (e) {
      print(e);
      return null;
    }
  }
}