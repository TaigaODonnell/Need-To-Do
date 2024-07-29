import 'package:flutter/material.dart';
import 'package:need_to_do/features/introduction/view/introduction.dart';
import 'package:need_to_do/features/splashScreen/viewmodel/splash_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:need_to_do/features/home/home_page.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashViewModel>().checkLoginStatus();
    });
    return Scaffold(
      body: Consumer<SplashViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.state == 'loading') {
            return _buildLoadingView();
          } else if (viewModel.state == 'authenticated') {
            return const HomePage();
          } else {
            return SplashScreen();
          }
        },
      ),
    );
  }

  Widget _buildLoadingView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/to-do-list.png', width: 200, height: 200),
          const SizedBox(height: 20),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
