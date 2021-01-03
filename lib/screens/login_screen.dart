import "package:flutter/material.dart";
import 'package:login/screens/list_client_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String userName;
  String password;
  bool loggedIn = false;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    void setLogInStatus() async {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setBool("isLoggedIn", loggedIn);
    }

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
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
                                loggedIn = true;
                                setLogInStatus();
                                Navigator.pushReplacementNamed(
                                    context, ListClientScreen.routeName);
                              } else {
                                loggedIn = false;
                                setLogInStatus();
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
        ),
      ),
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
