import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:need_to_do/features/auth/view/welcome_page.dart';
import 'package:need_to_do/features/introduction/viewmodel/introduction_viewmodel.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashScreenViewModel(),
      child: Scaffold(
        body: Consumer<SplashScreenViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.pages.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return IntroductionScreen(
              pages: viewModel.pages,
              done: const Text("Done"),
              next: const Text("Next"),
              skip: const Text("Skip"),
              onDone: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const WelcomePage()));
              },
              showSkipButton: true,
            );
          },
        ),
      ),
    );
  }
}
