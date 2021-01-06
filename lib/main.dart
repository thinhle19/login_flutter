import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/file_handling.dart';
import 'package:login/models/client_model.dart';
import 'package:login/screens/list_client_screen.dart';
import 'package:login/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  final clientModel = ClientModel();
  FileHandling.writeData(clientModel.clients);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
