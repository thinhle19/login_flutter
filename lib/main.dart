import 'package:flutter/material.dart';
import 'package:login/screens/add_user_screen.dart';
import 'package:login/screens/list_user_screen.dart';
import 'package:login/screens/login_screen.dart';
import 'package:login/screens/user_detail_screen.dart';

import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

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
        "/": (ctx) => ListUserScreen(),
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
