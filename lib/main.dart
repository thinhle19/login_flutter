import 'package:flutter/material.dart';
import 'package:login/models/user_model.dart';
import 'package:login/screens/add_user_screen.dart';
import 'package:login/screens/list_user_screen.dart';
import 'package:login/screens/login_screen.dart';
import 'package:login/screens/user_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserModel(),
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
        "/": (ctx) => (isLoggedIn ? ListUserScreen() : LoginScreen()),
        ListUserScreen.routeName: (ctx) => ListUserScreen(),
        AddUserScreen.routeName: (ctx) => AddUserScreen(),
        UserDetailScreen.routeName: (ctx) => UserDetailScreen(),
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
