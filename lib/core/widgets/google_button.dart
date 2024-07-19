import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const GoogleButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Image.asset(
        "assets/$title.png",
        scale: 1.5,
      ),
    );
  }
}
