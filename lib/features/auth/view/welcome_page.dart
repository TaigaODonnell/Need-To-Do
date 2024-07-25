import 'package:flutter/material.dart';
import 'package:need_to_do/core/widgets/button.dart';
import 'package:need_to_do/core/widgets/screen_title.dart';
import 'package:need_to_do/features/auth/view/login_page.dart';
import 'package:need_to_do/features/auth/view/signup_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ScreenTitle(title: "Welcome"),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    title: "Login",
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                    }),
                const SizedBox(height: 20),
                CustomButton(
                    title: "Sign Up",
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignupPage()));
                    }),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    print("Tapped");
                  },
                  child: const Text("Continue as Guest"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
