import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:login/models/client.dart';

class ClientDetailScreen extends StatelessWidget {
  static const routeName = "/client-detail";

  @override
  Widget build(BuildContext context) {
    final Client client = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: .9,
              child: Image.asset(
                client.fullBodyImageUrl,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 40, left: 15),
                              child: FittedBox(
                                child: Text(
                                  client.name,
                                  style: TextStyle(
                                    fontFamily: "Bodini",
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 0, left: 15),
                              child: FittedBox(
                                child: Text(
                                  client.phone,
                                  style: TextStyle(
                                    fontFamily: "Bodini",
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(15, 10, 20, 15),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: SingleChildScrollView(
                                    child: RichText(
                                      text: TextSpan(
                                          text: client.description,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontFamily: "AgencyFB",
                                          )),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                              client.avatarUrl,
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
