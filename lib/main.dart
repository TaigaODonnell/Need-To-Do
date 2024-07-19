// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:need_to_do/core/themes/theme.dart';
import 'package:need_to_do/features/auth/view/login_page.dart';
import 'package:need_to_do/features/auth/view/signup_page.dart';
import 'package:need_to_do/features/auth/view/welcome_page.dart';
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
      home: const LoginPage(),
    );
  }
}
