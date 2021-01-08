import 'package:flutter/material.dart';
import 'package:login/screens/list_client_screen.dart';
import 'package:login/screens/login_screen.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/client.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // deleteDatabase(join(await getDatabasesPath(), "clients_database.db"));
  //
  // final Future<Database> database = openDatabase(
  //   // Set the path to the database. Note: Using the `join` function from the
  //   // `path` package is best practice to ensure the path is correctly
  //   // constructed for each platform.
  //   join(await getDatabasesPath(), 'clients_database.db'),
  //   onCreate: (db, version) {
  //     return db.execute(
  //       "CREATE TABLE clients(id TEXT PRIMARY KEY, name TEXT, phone "
  //       "TEXT, avatarUrl TEXT, fullBodyImageUrl TEXT, description TEXT)",
  //     );
  //   },
  //   version: 1,
  // );
  //
  // Future<void> insertClient(Client client) async {
  //   final Database db = await database;
  //
  //   await db.insert(
  //     "clients",
  //     client.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }
  //
  // final client1 = Client(
  //   id: "1",
  //   avatarUrl: "assets/avatar.jpg",
  //   fullBodyImageUrl: "assets/full-body.png",
  //   phone: "0936 572 310",
  //   name: "Le Tien Thinh",
  //   description:
  //       "The self-study lessons in this section are written and organised "
  //       "according one two three four five six seven eight nine tento the levels of the Common European Framework of Reference for languages (CEFR). There are different types of texts and interactive exercises that practise the reading skills you need to do well in your studies, to get ahead at work and to communicate in English in your free time.",
  // );
  // final client2 = Client(
  //   id: "3",
  //   avatarUrl: "assets/avatar.jpg",
  //   fullBodyImageUrl: "assets/full-body.png",
  //   description:
  //       "The self-study lessons in this section are written and organised "
  //       "according one two three four five six seven eight nine tento the levels of the Common European Framework of Reference for languages (CEFR). There are different types of texts and interactive exercises that practise the reading skills you need to do well in your studies, to get ahead at work and to communicate in English in your free time.",
  //   phone: "0936 572 310",
  //   name: "Le Tien Thinh",
  // );
  //
  // await insertClient(client1);
  // await insertClient(client2);
  //
  // Future<List<Client>> getClients() async {
  //   final Database db = await database;
  //   final List<Map<String, dynamic>> maps = await db.query("clients");
  //
  //   print("length ${maps.length}");
  //
  //   return List.generate(maps.length, (i) {
  //     return Client(
  //       id: maps[i]["id"],
  //       name: maps[i]["name"],
  //       phone: maps[i]["phone"],
  //       avatarUrl: maps[i]["avatarUrl"],
  //       fullBodyImageUrl: maps[i]["fullBodyImageUrl"],
  //       description: maps[i]["description"],
  //     );
  //   });
  // }
  //
  // var results = await getClients();
  // print(results.elementAt(0).description);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (ctx) => LoginScreen(),
        ListClientScreen.routeName: (ctx) => ListClientScreen(),
        // AddClientScreen.routeName: (ctx) => AddClientScreen(),
        // ClientDetailScreen.routeName: (ctx) => ClientDetailScreen(),
        // EditClientScreen.routeName: (ctx) => EditClientScreen(),
      },
    );
  }
}
