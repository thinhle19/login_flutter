import "package:flutter/material.dart";
import 'package:login/widgets/beauty_textfield.dart';
import 'package:login/widgets/my_flat_button.dart';

import '../user.dart';

class LoginScreen extends StatefulWidget {
  final List<User> users;

  LoginScreen({this.users});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool foundedUser = false;
  TextEditingController _userNameController;
  TextEditingController _passwordController;

  void _submitLogin() {
    String _inputtedUsername = "_userNameController.text";
    String _inputtedPassword = "_passwordController.text";
    User matchedUser;

    matchedUser = widget.users.firstWhere((currentUser) {
      return (_inputtedUsername == currentUser.userName &&
          _inputtedPassword == currentUser.password);
    }, orElse: () => null);

    matchedUser == null ? foundedUser = false : foundedUser = true;
    print(foundedUser);
  }

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
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Opacity(
                          opacity: 0.5,
                          child: BeautyTextField(
                            controller: _userNameController,
                            textColor: Colors.green,
                            backgroundColor: Colors.black,
                            accentColor: Colors.white38,
                            width: 300,
                            height: 50,
                            prefixIcon: Icon(Icons.person_sharp),
                            inputType: TextInputType.name,
                            placeholder: "Username",
                          ),
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: BeautyTextField(
                            controller: _passwordController,
                            textColor: Colors.green,
                            backgroundColor: Colors.black,
                            accentColor: Colors.white38,
                            width: 300,
                            height: 50,
                            prefixIcon: Icon(Icons.lock_sharp),
                            inputType: TextInputType.text,
                            placeholder: "Password",
                            obscureText: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 180, bottom: 50),
                          child: MyFlatButton(
                            title: "Submit",
                            handler: () {
                              setState(() {
                                _submitLogin();
                              });
                            },
                            height: 40,
                            width: 250,
                            color: Colors.green.shade500.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
