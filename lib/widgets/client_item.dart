import "package:flutter/material.dart";
import 'package:login/models/client.dart';
import 'package:login/models/client_model.dart';
import 'package:login/screens/client_detail_screen.dart';

class ClientItem extends StatelessWidget {
  final Client client;
  final ClientModel clientModel;

  ClientItem(this.client, this.clientModel);

  void _selectClient(ctx, Client client) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
          builder: (BuildContext ctx) => ClientDetailScreen(client, clientModel)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectClient(context, client);
      },
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
                          client.avatarUrl,
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
                    client.phone,
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
                    client.name,
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
