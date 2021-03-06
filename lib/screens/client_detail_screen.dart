import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:login/models/client.dart';
import 'package:login/screens/edit_client_screen.dart';
import 'package:login/storage/fire_storage_service.dart';
import 'package:login/utils/database_transaction.dart';
import 'package:login/utils/image_picker.dart';

class ClientDetailScreen extends StatefulWidget {
  static const routeName = "/client-detail";

  final Client client;

  ClientDetailScreen(this.client);

  @override
  _ClientDetailScreenState createState() => _ClientDetailScreenState();
}

class _ClientDetailScreenState extends State<ClientDetailScreen> {
  Future<Client> loadClient() async {
    return DatabaseTransaction.getClientById(widget.client.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Client>(
      future: loadClient(),
      builder: (context, AsyncSnapshot<Client> snapshot) {
        if (!snapshot.hasData) {
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: Text("Loading profile..."),
              ),
            ),
          );
        } else
          return SafeArea(
            child: Scaffold(
                body: Stack(
              fit: StackFit.expand,
              children: [
                Opacity(
                  opacity: .9,
                  child: Image.asset(
                    snapshot.data.fullBodyImageUrl,
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
                                            snapshot.data.name,
                                            style: TextStyle(
                                              fontFamily: "Bodini",
                                              fontSize: 30,
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
                                              child: Icon(Icons.edit_sharp),
                                              color: Colors.cyan.shade200,
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditClientScreen(
                                                            snapshot.data),
                                                  ),
                                                )
                                                    .then((value) {
                                                  setState(() {});
                                                });
                                              },
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
                                        snapshot.data.phone,
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
                                                text: snapshot.data.description,
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
                          child: FutureBuilder(
                            future: _getImage(context, snapshot.data.avatarUrl),
                            builder: (
                              context,
                              imageSnapshot,
                            ) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done)
                                return InkWell(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(ImageCapture.routeName),
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: imageSnapshot.data,
                                      ),
                                    ),
                                  ),
                                );
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting)
                                return InkWell(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(ImageCapture.routeName),
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                );
                              return Text("error");
                            },
                          ),
                          /* InkWell(
                            onTap:() => Navigator.of(context).pushNamed
                              (ImageCapture.routeName),
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
                                      snapshot.data.avatarUrl,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),*/
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          );
      },
    );
  }

  Future<Image> _getImage(BuildContext context, String image) async {
    Image m;
    print(image);
    await FireStorageService.loadFromStorage(context, image).then(
      (downloadUrl) {
        m = Image.network(
          image,
          fit: BoxFit.fill,
        );
      },
    );
    return m;
  }

//todo old thing not using FutureBuilder, for later if there's fucking bug
/*@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
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
                                        fontSize: 30,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: FlatButton(
                                        child: Icon(Icons.edit_sharp),
                                        color: Colors.cyan.shade200,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EditClientScreen(
                                                      widget.client),
                                            ),
                                          );
                                        },
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
                                padding: EdgeInsets.fromLTRB(15, 10, 20, 15),
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
      )),
    );
  }*/
}
