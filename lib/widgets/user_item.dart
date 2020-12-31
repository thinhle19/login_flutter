import "package:flutter/material.dart";
import 'package:login/screens/user_detail_screen.dart';

class UserItem extends StatelessWidget {
  final String id;
  final String name;
  final String phone;
  final String avatarUrl;

  UserItem({
    this.id,
    this.name,
    this.phone,
    this.avatarUrl,
  });

  void _selectUser(ctx) {
    Navigator.of(ctx).pushNamed(
      UserDetailScreen.routeName,
      arguments: id,
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
                          avatarUrl,
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
                    phone,
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
                    name,
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
