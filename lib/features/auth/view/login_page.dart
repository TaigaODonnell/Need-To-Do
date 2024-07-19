import 'package:flutter/material.dart';
import 'package:need_to_do/core/widgets/google_button.dart';
import 'package:need_to_do/core/widgets/gradient_button.dart';
import 'package:need_to_do/core/widgets/or_divider.dart';
import 'package:need_to_do/core/widgets/screen_title.dart';
import 'package:need_to_do/core/widgets/textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const ScreenTitle(title: "Login"),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomField(hintText: "Email"),
                  const SizedBox(height: 20),
                  const CustomField(hintText: "Password"),
                  const SizedBox(height: 20),
                  const GradientButton(title: "Login"),
                  const SizedBox(height: 20),
                  const OrDivider(),
                  const SizedBox(height: 20),
                  const GoogleButton(title: "login"),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      print("Tapped");
                    },
                    child: const Text("Forgot Password"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
