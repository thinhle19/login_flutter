import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'models/client.dart';

class FileHandling {
  static Future<String> get _localPath async {
    print("THIS IS WHAT U WANT");
    final directory = await getApplicationDocumentsDirectory();
    print("THIS IS WHAT U WANT$directory");
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/data.txt");
  }

  static void writeData(List<Client> clients) async {
    final file = await _localFile;

    for (int i = 0; i < clients.length; i++) {
      file.writeAsString("${clients[i].id}");
      print("writing $i");
    }
  }
}
