import 'package:flutter/material.dart';
import 'package:need_to_do/core/themes/app_colors.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color, width: 3),
      );

  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(20),
      enabledBorder: _border(AppColors.borderColor),
      focusedBorder: _border(AppColors.focusedBorder),
      errorBorder: _border(AppColors.errorColor),
      focusedErrorBorder: _border(AppColors.errorColor),
    ),
  );
}
