import 'dart:convert';

import 'package:animal_care_flutter_app/screens/HomePage.dart';
import 'package:animal_care_flutter_app/screens/PetRegisterPage.dart';
import 'package:animal_care_flutter_app/screens/SignupPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String id = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String url = "http://127.0.0.1:3001";

  String _username = "";
  String _password = "";

  bool _isLoading = false;
  String? _errorMessage;

  void _handleLogin() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final loginUrl = Uri.parse('$url/user/signin');
    final response = await http.post(
      loginUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'uid': _username,
        'upw': _password,
      }),
    );
    final responseJson = jsonDecode(response.body);

    switch (responseJson["code"]){
      case 0:
        print(responseJson["msg"]);
        if (context.mounted) context.go(HomePage.id);
        break;
      case 3:
        print(responseJson["msg"]);
        //TODO: Handle non-existing ID
        break;
      case 4:
        print(responseJson["msg"]);
        //TODO: Handle Invalid password
        break;
    }

    setState(() {
      _isLoading = false;
    });

  }

  //:TODO: Implement keyboard behaviour.
  @override
  Widget build(BuildContext context) {
    // Scaffold - basic layout with FAB
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Login Page",
        ),
        backgroundColor: Colors.green[400],
      ),
      body: CustomScrollView(
        slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                //TODO: Add Global margins
                margin: EdgeInsets.all(24),
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage('assets/img/logo.png'),
                              height: 200,
                              width: 200,
                            ),
                            const Text("건강한 견생의 일상"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("푸푸케어",
                                    style: TextStyle(color: Colors.greenAccent)),
                                Text("에서 함께 해주세요")
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Padding(
                              //TODO: Change to Global Styles
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    _username = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter Username',
                                ),
                              ),
                            ),
                            Padding(
                              //TODO: Change to Global Styles
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: TextField(
                                // textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter Password',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _password = value;
                                  });
                                },
                              ),
                            ),

                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  print(_username);
                                  print(_password);
                                  _handleLogin();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "Forgot Login / ",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.push(PetRegisterPage.id);
                                      } //TODO: Add route to a Forgot Login
                                ),
                                TextSpan(
                                    text: "Forgot Password / ",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.push(PetRegisterPage.id);
                                      } //TODO: Add route to Login Page
                                ),
                                TextSpan(
                                    text: "Sign Up",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.push(SignupPage.id);
                                      }
                                ),
                              ])),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ],
      ),
    );
  }
}

