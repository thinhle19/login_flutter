import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'client.dart';

class DatabaseTransaction {
  Future<Database> database;

  void initializeDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
    database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertClient(Client client) async {
    final Database db = await database;

    await db.insert(
      "clients",
      client.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Client>> getClients() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query("clients");

    return List.generate(maps.length, (i) {
      return Client(
        id: maps[i]["id"],
        avatarUrl: maps[i]["avatarUrl"],
        name: maps[i]["name"],
        fullBodyImageUrl: maps[i]["fullBodyImageUrl"],
        phone: maps[i]["phone"],
        description: maps[i]["description"],
      );
    });
  }

  void test() async {
    final client1 = Client(
      id: "1",
      avatarUrl: "assets/avatar.jpg",
      fullBodyImageUrl: "assets/full-body.png",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      description:
      "The self-study lessons in this section are written and organised "
          "according one two three four five six seven eight nine tento the levels of the Common European Framework of Reference for languages (CEFR). There are different types of texts and interactive exercises that practise the reading skills you need to do well in your studies, to get ahead at work and to communicate in English in your free time.",
    );
    final client2 = Client(
      id: "3",
      avatarUrl: "assets/avatar.jpg",
      fullBodyImageUrl: "assets/full-body.png",
      description:
      "The self-study lessons in this section are written and organised "
          "according one two three four five six seven eight nine tento the levels of the Common European Framework of Reference for languages (CEFR). There are different types of texts and interactive exercises that practise the reading skills you need to do well in your studies, to get ahead at work and to communicate in English in your free time.",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
    );

    await insertClient(client1);
    await insertClient(client2);

    var results = await getClients();
    print(results.elementAt(0).name);
  }
}
