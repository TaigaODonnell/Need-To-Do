import 'package:flutter/material.dart';
import 'package:need_to_do/core/widgets/button.dart';
import 'package:need_to_do/core/widgets/screen_title.dart';

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
                const CustomButton(title: "Login"),
                const SizedBox(height: 20),
                const CustomButton(title: "Sign Up"),
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
