import 'package:flutter/material.dart';
import 'package:need_to_do/core/themes/app_colors.dart';

class Task {
  final String id;
  final String title;
  final List<DateTime> doDates;
  final String priority;
  final bool isCompleted;
  final int color;
  final String? userId;

  Task({
    required this.id,
    required this.title,
    required this.doDates,
    required this.priority,
    this.isCompleted = false,
    required this.color,
    this.userId,
  });

  factory Task.fromFirestore(Map<String, dynamic> data) {
    List<DateTime> parseDateList(dynamic data) {
      if (data is List) {
        return data
            .map((date) => DateTime.fromMicrosecondsSinceEpoch(date as int))
            .toList();
      }
      return [];
    }

    return Task(
      id: data['id'] ?? "",
      title: data['title'] ?? "",
      doDates: parseDateList([data['doDates']]),
      priority: data['priority'] ?? "",
      isCompleted: data['isCompleted'] ?? false,
      color: data['color'] ?? AppColors.taskColor.value,
      userId: data['userId'],
    );
  }

  Map<String, dynamic> toFirestore() {
    List<int> convertDateList(List<DateTime> dates) {
      return dates.map((date) => date.microsecondsSinceEpoch).toList();
    }

    return {
      'id': id,
      'title': title,
      'doDates': convertDateList(doDates),
      'priority': priority,
      'isCompleted': isCompleted,
      'color': color,
      'userId': userId,
    };
  }

  Color get colorAsColor => Color(color);
}
