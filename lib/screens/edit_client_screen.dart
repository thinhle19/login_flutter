import "package:flutter/material.dart";
import 'package:login/models/client.dart';
import 'package:login/utils/database_transaction.dart';
import 'package:login/screens/client_detail_screen.dart';
import 'package:login/widgets/my_text_field_item.dart';

class EditClientScreen extends StatefulWidget {
  static const routeName = "/edit-client";

  final Client client;

  EditClientScreen(this.client);

  @override
  _EditClientScreenState createState() => _EditClientScreenState();
}

class _EditClientScreenState extends State<EditClientScreen> {
  @override
  Widget build(BuildContext context) {
    final oldName = widget.client.name;
    final oldPhone = widget.client.phone;
    final oldDescription = widget.client.description;
    final nameController = TextEditingController()..text = oldName;
    final phoneController = TextEditingController()..text = oldPhone;
    final descriptionController = TextEditingController()
      ..text = oldDescription;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Add Member",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "AgencyFB",
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              MyTextFieldItem(
                hintText: "Username",
                controller: nameController,
              ),
              MyTextFieldItem(
                hintText: "Phone",
                keyboardType: TextInputType.phone,
                controller: phoneController,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 40, 25, 20),
                child: TextField(
                  controller: descriptionController,
                  expands: false,
                  maxLines: 5,
                  minLines: 1,
                  style: TextStyle(
                    fontFamily: "Bodini",
                    fontSize: 25,
                  ),
                  decoration: InputDecoration(
                    hintText: "Description",
                    hintStyle: TextStyle(
                      fontFamily: "AgencyFB",
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset.fromDirection(0.6, 30 / 6),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: FlatButton(
                  child: FittedBox(
                    child: Text(
                      "Done",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Colors.cyan,
                  onPressed: () {
                    print(nameController.text);
                    var newCmnClient = Client(
                      id: widget.client.id,
                      phone: phoneController.text,
                      name: nameController.text,
                      description: descriptionController.text,
                      fullBodyImageUrl: widget.client.fullBodyImageUrl,
                      avatarUrl: widget.client.avatarUrl,
                    );
                    DatabaseTransaction.updateClient(newCmnClient);
                    Navigator.of(context).pop();
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(
                    //     builder: (context) => ClientDetailScreen(newCmnClient),
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
