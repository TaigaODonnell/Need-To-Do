import 'package:flutter/material.dart';
import 'package:need_to_do/core/themes/theme.dart';
import 'package:need_to_do/features/introduction/view/introduction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Need To Do',
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
