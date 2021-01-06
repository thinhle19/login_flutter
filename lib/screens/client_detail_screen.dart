import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:login/models/client.dart';
import 'package:login/models/client_model.dart';
import 'package:login/screens/edit_client_screen.dart';
import 'package:provider/provider.dart';

class ClientDetailScreen extends StatefulWidget {
  static const routeName = "/client-detail";

  final Client client;
  final ClientModel clientModel;

  ClientDetailScreen(this.client, this.clientModel);

  @override
  _ClientDetailScreenState createState() => _ClientDetailScreenState();
}

class _ClientDetailScreenState extends State<ClientDetailScreen> {
  @override
  Widget build(BuildContext context) {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage
        .instance.ref("/client.txt");
    return SafeArea(
      child: Scaffold(
        body: Consumer<ClientModel>(
          builder: (context, client, child) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Opacity(
                  opacity: .9,
                  child: Image.asset(
                    widget.client.fullBodyImageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: 390,
                    ),
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
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            widget.client.name,
                                            style: TextStyle(
                                              fontFamily: "Bodini",
                                              fontSize: 40,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            child: FlatButton(
                                              color: Colors.cyan.shade200,
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          EditClientScreen(
                                                              widget.client,
                                                              widget
                                                                  .clientModel)),
                                                );
                                              },
                                              child: Icon(Icons.edit_sharp),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 0, left: 15),
                                    child: FittedBox(
                                      child: Text(
                                        widget.client.phone,
                                        style: TextStyle(
                                          fontFamily: "Bodini",
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 10, 20, 15),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: SingleChildScrollView(
                                          child: RichText(
                                            text: TextSpan(
                                                text: widget.client.description,
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
                                    widget.client.avatarUrl,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
