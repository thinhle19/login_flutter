import 'package:flutter/material.dart';
import 'package:login/models/client_model.dart';
import 'package:login/screens/add_client_screen.dart';
import 'package:login/screens/client_detail_screen.dart';
import 'package:login/screens/edit_client_screen.dart';
import 'package:login/screens/list_client_screen.dart';
import 'package:login/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
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
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLogInStatus();
  }

  void checkLogInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = prefs.getBool("isLoggedIn");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // fontFamily: "AgencyFB",
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (ctx) => (isLoggedIn ? ListClientScreen() : LoginScreen()),
        ListClientScreen.routeName: (ctx) => ListClientScreen(),
        AddClientScreen.routeName: (ctx) => AddClientScreen(),
        ClientDetailScreen.routeName: (ctx) => ClientDetailScreen(),
        EditClientScreen.routeName: (ctx) => EditClientScreen(),
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(),
//         body: Center(
//           child: Text("Login Pet Project"),
//         ),
//       ),
//     );
//   }
// }
