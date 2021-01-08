import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'client.dart';

class DatabaseTransaction {
  static final Future<Database> database = initializeDatabase();

  /* static void initializeDatabase() async {
    deleteDatabase(join(await getDatabasesPath(), "clients_database.db"));
    WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
    database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'clients_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE clients(id INTEGER PRIMARY KEY, name TEXT, phone "
          "TEXT, avatarUrl TEXT, fullBodyImageUrl TEXT, description TEXT)",
        );
      },
      version: 1,
    );
  }*/

  static Future<Database> initializeDatabase() async {
    // deleteDatabase(join(await getDatabasesPath(), "clients_database.db"));
    WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
    return openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'clients_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE IF NOT EXISTS clients(id TEXT PRIMARY KEY, name TEXT, phone TEXT, avatarUrl TEXT, fullBodyImageUrl TEXT, description TEXT)",
        );
      },
      version: 1,
    );
  }

  static Future<void> insertClient(Client client) async {
    final Database db = await database;
    // database = await initializeDatabase();

    await db.insert(
      "clients",
      client.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Client>> getClients() async {
    final Database db = await database;

    //___for dummy data
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
    final client3 = Client(
      id: "5",
      avatarUrl: "assets/avatar.jpg",
      fullBodyImageUrl: "assets/full-body.png",
      description:
          "The self-study lessons in this section are written and organised "
          "according one two three four five six seven eight nine ten to the "
          "levels of the Common European Framework of Reference for languages (CEFR). There are different types of texts and interactive exercises that practise the reading skills you need to do well in your studies, to get ahead at work and to communicate in English in your free time.",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
    );

    await insertClient(client1);
    await insertClient(client2);
    await insertClient(client3);
    //....end for dummy datas

    final List<Map<String, dynamic>> maps = await db.query("clients");

    print(maps.length);

    await db.close();
    return List.generate(maps.length, (i) {
      return Client(
        id: maps[i]["id"],
        name: maps[i]["name"],
        phone: maps[i]["phone"],
        avatarUrl: maps[i]["avatarUrl"],
        fullBodyImageUrl: maps[i]["fullBodyImageUrl"],
        description: maps[i]["description"],
      );
    });
  }

  static void test() async {
    // initializeDatabase();
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
