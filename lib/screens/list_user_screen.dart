import "package:flutter/material.dart";

import '../user.dart';

class ListUserScreen extends StatefulWidget {
  static const routeName = "list-user";

  @override
  _ListUserScreenState createState() => _ListUserScreenState();
}

class _ListUserScreenState extends State<ListUserScreen> {
  List<User> users = [
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "admin",
      userName: "admin",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "admin",
      userName: "admin",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "admin",
      userName: "admin",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "admin",
      userName: "admin",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "admin",
      userName: "admin",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "admin",
      userName: "admin",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "admin",
      userName: "admin",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "admin",
      userName: "admin",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "admin",
      userName: "admin",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "admin",
      userName: "admin",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "admin",
      userName: "admin",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "admin",
      userName: "admin",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "admin",
      userName: "admin",
    ),
    User(
      avatarUrl: "assets/test_image.jpg",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "admin",
      userName: "admin",
    ),
  ];

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
            children: users
                .map(
                  (user) => GestureDetector(
                    onTap: () {
                      //todo delete
                      print("tapped");
                    },
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        child: Column(
                          children: [
                            Flexible(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.all(3),
                                child: ClipRRect(
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius: BorderRadius.circular(50),
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: FittedBox(
                                      clipBehavior: Clip.antiAlias,
                                      fit: BoxFit.fill,
                                      child: Image.asset(
                                        user.avatarUrl,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: Text(
                                  user.phone,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Bodini",
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: Text(
                                  user.name,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "AgencyFB",
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
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
