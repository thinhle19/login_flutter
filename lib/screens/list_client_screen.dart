import "package:flutter/material.dart";
import 'package:login/models/client_model.dart';
import 'package:login/screens/add_client_screen.dart';
import 'package:login/widgets/client_item.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListClientScreen extends StatefulWidget {
  static const routeName = "/list-client";

  @override
  _ListClientScreenState createState() => _ListClientScreenState();
}

class _ListClientScreenState extends State<ListClientScreen> {
  void setLoggedOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", false);
  }

  @override
  Widget build(BuildContext context) {
    var clientModel = Provider.of<ClientModel>(context, listen: true);

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
            "Current Crews",
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
          children: clientModel.clients
              .map(
                (client) => ClientItem(client),
              )
              .toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return AddClientScreen();
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
