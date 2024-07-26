import 'package:flutter/material.dart';
import 'package:need_to_do/core/widgets/button.dart';
import 'package:need_to_do/core/widgets/screen_title.dart';
import 'package:need_to_do/features/auth/view/login_page.dart';
import 'package:need_to_do/features/auth/view/signup_page.dart';
import 'package:need_to_do/features/home/home_page.dart';
import 'package:need_to_do/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:need_to_do/features/navigation/navigation.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});
  final Navigation _navigation = Navigation();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewmodel>(context);
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
                      _navigation.push(context, const LoginPage());
                    }),
                const SizedBox(height: 20),
                CustomButton(
                    title: "Sign Up",
                    onPressed: () {
                      _navigation.push(context, const SignupPage());
                    }),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    await authViewModel.anonymousSignIn();
                    if (authViewModel.errorMessage != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(authViewModel.errorMessage!)));
                    } else {
                      _navigation.pushR(context, const HomePage());
                    }
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
