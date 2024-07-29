// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:need_to_do/core/models/user.dart';
import 'package:need_to_do/core/themes/theme.dart';
import 'package:need_to_do/core/viewmodels/user_provider.dart';
import 'package:need_to_do/features/auth/view/login_page.dart';
import 'package:need_to_do/features/auth/view/signup_page.dart';
import 'package:need_to_do/features/auth/view/welcome_page.dart';
import 'package:need_to_do/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:need_to_do/features/home/home_page.dart';
import 'package:need_to_do/features/introduction/view/introduction.dart';
import 'package:need_to_do/core/services/firebase_options.dart';
import 'package:need_to_do/features/splashScreen/view/splash_view.dart';
import 'package:need_to_do/features/splashScreen/viewmodel/splash_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'need-to-do',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProxyProvider<UserProvider, AuthViewmodel>(
            create: (context) => AuthViewmodel(
              Provider.of<UserProvider>(context, listen: false),
            ),
            update: (context, userProvider, authViewmodel) =>
                AuthViewmodel(userProvider),
          ),
          ChangeNotifierProxyProvider<AuthViewmodel, SplashViewModel>(
            create: (context) => SplashViewModel(
              Provider.of<AuthViewmodel>(context, listen: false),
            ),
            update: (context, authViewModel, previous) =>
                previous ?? SplashViewModel(authViewModel),
          ),
        ],
        child: MaterialApp(
          title: 'Need To Do',
          theme: AppTheme.darkTheme,
          home: const LoadingScreen(),
        ));
  }
}
