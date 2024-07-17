import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class SplashScreenViewModel extends ChangeNotifier {
  List<PageViewModel> _pages = [];

  List<PageViewModel> get pages => _pages;

  SplashScreenViewModel() {
    _loadPages();
  }

  void _loadPages() {
    _pages = [
      PageViewModel(
        title: "Welcome to Need To Do",
        body: "This is a simple app to help you manage your to do list.",
        image: Image.asset("assets/to-do-list.png", height: 175),
      ),
      PageViewModel(
        title: "Features",
        body: "Canvas Integration, Task List, Reminders, and more!",
        image: Image.asset("assets/to-do-list.png", height: 175),
      ),
      PageViewModel(
        title: "Login or Sign Up or Use Offline",
        body: "Best to use online mode for full canvas integration.",
        image: Image.asset("assets/to-do-list.png", height: 175),
      ),
    ];
    notifyListeners();
  }
}
