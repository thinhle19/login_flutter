import "package:flutter/material.dart";
import 'package:login/models/USER_DATA.dart';

class UserDetailScreen extends StatelessWidget {
  static const routeName = "/user-detail";

  @override
  Widget build(BuildContext context) {
    final userId = ModalRoute.of(context).settings.arguments;
    final selectedUser = USER_DATA.firstWhere((user) => userId == user.id);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: .9,
              child: Image.asset(
                selectedUser.fullBodyImageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Text("Name"),
                            Text("Phone"),
                            Text("Description"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 15, 0, 0),
                    child: Container(
                      height: 70,
                      width: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                              selectedUser.avatarUrl,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
