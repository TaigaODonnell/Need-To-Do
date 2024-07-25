// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:need_to_do/core/themes/theme.dart';
import 'package:need_to_do/features/auth/view/login_page.dart';
import 'package:need_to_do/features/auth/view/signup_page.dart';
import 'package:need_to_do/features/auth/view/welcome_page.dart';
import 'package:need_to_do/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:need_to_do/features/introduction/view/introduction.dart';
import 'package:need_to_do/core/services/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewmodel(),
        ),
      ],
      child: MaterialApp(
        title: 'Need To Do',
        theme: AppTheme.darkTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
