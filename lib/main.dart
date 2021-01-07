import 'package:flutter/material.dart';
import 'package:login/screens/list_client_screen.dart';
import 'package:login/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
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
