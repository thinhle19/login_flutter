import "package:flutter/material.dart";
import 'package:login/models/local_storage.dart';
import 'package:login/screens/list_client_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String userName;
  String password;
  Future<bool> isLoggedInBefore = LocalStorage().checkState();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<bool>(
      future: isLoggedInBefore,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.data == false) {
          return Scaffold(
            body: Builder(builder: (BuildContext context) {
              return SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        Text(
                          "Welcome",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Input your username and password",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: screenHeight * 0.08,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              buildUsernameFormField(),
                              SizedBox(
                                height: 30,
                              ),
                              buildPasswordFormField(),
                              SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  color: Colors.green,
                                  onPressed: () {
                                    print(userNameController.text);
                                    print(passwordController.text);
                                    if (userNameController.text == "admin" &&
                                        passwordController.text == "admin") {
                                      Navigator.pushReplacementNamed(
                                          context, ListClientScreen.routeName);
                                    } else {
                                      Scaffold.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'Account does not exist, try again!'),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.08,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        } else if (snapshot.data == true) {
          return ListClientScreen();
        } else {
          return Scaffold(
            body: Center(
              child: Text("WAITING..."),
            ),
          );
        }
      },
    );
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      controller: userNameController,
      keyboardType: TextInputType.text,
      onSaved: (newVal) => userName = newVal,
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "Enter username",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person_sharp),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      onSaved: (newVal) => password = newVal,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock_sharp),
      ),
    );
  }
}
