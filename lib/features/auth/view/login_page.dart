import 'package:flutter/material.dart';
import 'package:need_to_do/core/widgets/google_button.dart';
import 'package:need_to_do/core/widgets/gradient_button.dart';
import 'package:need_to_do/core/widgets/or_divider.dart';
import 'package:need_to_do/core/widgets/screen_title.dart';
import 'package:need_to_do/core/widgets/textfield.dart';
import 'package:need_to_do/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:need_to_do/features/home/home_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewmodel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const ScreenTitle(title: "Login"),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomField(
                      hintText: "Email",
                      controller: emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomField(
                        hintText: "Password",
                        controller: passwordController,
                        obscureText: true),
                    const SizedBox(height: 20),
                    GradientButton(
                      title: "Login",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await authViewModel.login(
                              emailController.text, passwordController.text);
                          if (authViewModel.errorMessage != null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(authViewModel.errorMessage!)));
                          } else {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    const OrDivider(),
                    const SizedBox(height: 20),
                    GoogleButton(
                      title: "login",
                      onPressed: () async {
                        await authViewModel.loginWithGoogle();
                        if (authViewModel.errorMessage != null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(authViewModel.errorMessage!)));
                        } else {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        }
                      },
                    ),
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
          ),
        ],
      ),
    );
  }
}
