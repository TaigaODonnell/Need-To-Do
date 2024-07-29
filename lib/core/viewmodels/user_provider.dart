import 'package:flutter/material.dart';
import 'package:need_to_do/core/models/user.dart';

class UserProvider extends ChangeNotifier {
  AppUser? _user;

  AppUser? get user => _user;

  get authStateChanges => null;

  void setUser(AppUser? user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
