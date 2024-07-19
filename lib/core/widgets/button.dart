import 'package:flutter/material.dart';
import 'package:need_to_do/core/themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  const CustomButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor,
        fixedSize: const Size(395, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(title,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.buttonTextColor)),
    );
  }
}
