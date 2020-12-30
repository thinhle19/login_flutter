import 'package:flutter/material.dart';
import 'package:login/screens/add_user_screen.dart';
import 'package:login/screens/list_user_screen.dart';
import 'package:login/screens/login_screen.dart';

import 'user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<User> users = [
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "@123",
      userName: "@123",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Matched User",
      password: "admin",
      userName: "admin",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "@123",
      userName: "@123",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "@123",
      userName: "@123",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "@123",
      userName: "@123",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "@123",
      userName: "@123",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "@123",
      userName: "@123",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "@123",
      userName: "@123",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "@123",
      userName: "@123",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "@123",
      userName: "@123",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "@123",
      userName: "@123",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "@123",
      userName: "@123",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "@123",
      userName: "@123",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "@123",
      userName: "@123",
    ),
  ];

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
        "/": (ctx) => LoginScreen(),
        ListUserScreen.routeName: (ctx) => ListUserScreen(users: users),
        AddUserScreen.routeName: (ctx) => AddUserScreen(),
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
