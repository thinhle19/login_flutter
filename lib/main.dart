import 'package:flutter/material.dart';
import 'package:login/file_handling.dart';
import 'package:login/models/client_model.dart';
import 'package:login/screens/add_client_screen.dart';
import 'package:login/screens/client_detail_screen.dart';
import 'package:login/screens/edit_client_screen.dart';
import 'package:login/screens/list_client_screen.dart';
import 'package:login/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final clientModel = ClientModel();
  FileHandling.writeData(clientModel.clients);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ClientModel(),
      child: MyApp(),
    ),
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
