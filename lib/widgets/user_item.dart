import "package:flutter/material.dart";
import 'package:login/models/user.dart';
import 'package:login/screens/user_detail_screen.dart';

class UserItem extends StatelessWidget {
  final User user;


  UserItem(this.user);

  void _selectUser(ctx) {
    Navigator.of(ctx).pushNamed(
      UserDetailScreen.routeName,
      arguments: user,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {_selectUser(context);},
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                  padding: const EdgeInsets.symmetric(vertical: 2),
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
                  padding: const EdgeInsets.symmetric(vertical: 2),
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
    );
  }
}
