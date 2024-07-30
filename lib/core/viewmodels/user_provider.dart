import 'package:flutter/material.dart';
import 'package:need_to_do/core/models/task.dart';
import 'package:need_to_do/core/models/user.dart';
import 'package:need_to_do/core/services/task_service.dart';

class UserProvider extends ChangeNotifier {
  AppUser? _user;
  List<Task>? _tasks = [];

  AppUser? get user => _user;
  List<Task>? get tasks => _tasks;

  get authStateChanges => null;

  void setUser(AppUser? user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    _tasks?.clear();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    if (_user != null) {
      try {
        _tasks?.add(task);
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
  }
}
