import 'package:animal_care_flutter_app/screens/LoginPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);
  static String id = "/signup";

  @override
  Widget build(BuildContext context) {
    // Scaffold - basic layout with FAB
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Signup Page",
        ),
        backgroundColor: Colors.green[400],
      ),
      body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/img/logo.png'),
                        height: 100,
                        width: 100,
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
                //TODO: Add Sing Up process via google and kakao.
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.mail_outline_outlined),
                          label: const Text("카카오로 가입하기"),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.mail_outline_outlined),
                          label: const Text("Gmail로 가입하기"),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Text.rich(TextSpan(children: [
                      const TextSpan(text: "이미 가입하셨나요? "),
                      TextSpan(
                          style: const TextStyle(color: Colors.grey),
                          text: "로그인하기",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go(LoginPage.id);
                            } //TODO: Add route to Login Page
                          ),
                    ]))),


              ],
            ),
          )),
    );
  }
}
