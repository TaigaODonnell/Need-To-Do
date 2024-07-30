import 'package:flutter/material.dart';
import 'package:need_to_do/core/models/task.dart';
import 'package:need_to_do/core/services/task_service.dart';
import 'package:need_to_do/core/themes/app_colors.dart';
import 'package:need_to_do/core/viewmodels/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class TaskViewmodel extends ChangeNotifier {
  final TaskService _taskService = TaskService();
  final uuid = const Uuid();

  Future<void> addTask(String title, String uid, BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final task = Task(
      id: uuid.v4(),
      title: title,
      doDates: [DateTime.now()],
      priority: 'low',
      color: AppColors.taskColor.value,
      userId: userProvider.user!.uid,
    );
    try {
      await _taskService.addTask(task);
      await userProvider.addTask(task);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
