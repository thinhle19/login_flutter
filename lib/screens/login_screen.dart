import "package:flutter/material.dart";
import 'package:login/widgets/beauty_textfield.dart';
import 'package:login/widgets/my_flat_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Opacity(
                  opacity: 0.8,
                  child: Image.asset(
                    "assets/login_background.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: BeautyTextfield(
                        textColor: Colors.cyanAccent,
                        backgroundColor: Colors.black,
                        accentColor: Colors.grey,
                        width: 300,
                        height: 50,
                        prefixIcon: Icon(Icons.person_sharp),
                        inputType: TextInputType.name,
                        placeholder: "Username",
                      ),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: BeautyTextfield(
                        textColor: Colors.cyanAccent,
                        backgroundColor: Colors.black,
                        accentColor: Colors.grey,
                        width: 300,
                        height: 50,
                        prefixIcon: Icon(Icons.lock),
                        inputType: TextInputType.text,
                        placeholder: "Password",
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 180,bottom: 50),
                      child: MyFlatButton(
                        title: "Submit",
                        handler: () {},
                        height: 40,
                        width: 250,
                        color: Colors.green.shade500.withOpacity(.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
