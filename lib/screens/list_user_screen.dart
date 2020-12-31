import "package:flutter/material.dart";
import 'package:login/models/USER_DATA.dart';
import 'package:login/screens/add_user_screen.dart';
import 'package:login/screens/user_detail_screen.dart';
import 'package:login/widgets/user_item.dart';

import '../models/user.dart';

class ListUserScreen extends StatefulWidget {
  static const routeName = "list-user";

  @override
  _ListUserScreenState createState() => _ListUserScreenState();
}

class _ListUserScreenState extends State<ListUserScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
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
            children: USER_DATA
                .map(
                  (user) => UserItem(
                    id: user.id,
                    name: user.name,
                    avatarUrl: user.avatarUrl,
                    phone: user.phone,
                  ),
                )
                .toList(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddUserScreen.routeName);
            },
            backgroundColor: Colors.cyan,
            child: IconButton(
              icon: FittedBox(child: Icon(Icons.add)),
              iconSize: 45,
              onPressed: () {},
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
