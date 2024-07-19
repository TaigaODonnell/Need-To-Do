import 'package:flutter/material.dart';
import 'package:need_to_do/core/themes/app_colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: Divider(
          color: AppColors.borderColor,
          thickness: 2,
        )),
        SizedBox(width: 10),
        Text(
          "or",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 10),
        Expanded(child: Divider(color: AppColors.borderColor, thickness: 2)),
      ],
    );
  }
}
