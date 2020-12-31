import 'dart:io';

import "package:flutter/material.dart";
import 'package:login/models/user_model.dart';
import 'package:login/screens/add_user_screen.dart';
import 'package:login/widgets/user_item.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListUserScreen extends StatefulWidget {
  static const routeName = "/list-user";

  @override
  _ListUserScreenState createState() => _ListUserScreenState();
}

class _ListUserScreenState extends State<ListUserScreen> {
  void setLoggedOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", false);
  }

  @override
  Widget build(BuildContext context) {
    var userModel = Provider.of<UserModel>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: FlatButton(
                onPressed: () {
                  setLoggedOut();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.exit_to_app_sharp),
                    Text("Logout"),
                  ],
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Text(
            "List User",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "AgencyFB",
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
          children: userModel.users
              .map(
                (user) => UserItem(
                  user,
                ),
              )
              .toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return AddUserScreen();
            }));
          },
          backgroundColor: Colors.cyan,
          child: Icon(
            Icons.add,
            size: 40,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
