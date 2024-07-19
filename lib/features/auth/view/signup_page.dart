import 'package:flutter/material.dart';
import 'package:need_to_do/core/widgets/google_button.dart';
import 'package:need_to_do/core/widgets/gradient_button.dart';
import 'package:need_to_do/core/widgets/or_divider.dart';
import 'package:need_to_do/core/widgets/screen_title.dart';
import 'package:need_to_do/core/widgets/textfield.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const ScreenTitle(title: "Sign Up"),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomField(hintText: "Name"),
                  SizedBox(height: 20),
                  CustomField(hintText: "Email"),
                  SizedBox(height: 20),
                  CustomField(hintText: "Password"),
                  SizedBox(height: 20),
                  GradientButton(title: "Sign Up"),
                  SizedBox(height: 20),
                  OrDivider(),
                  SizedBox(height: 20),
                  GoogleButton(title: "signup"),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
