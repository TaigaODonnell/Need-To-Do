import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final String title;
  const GoogleButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Tapped");
      },
      child: Image.asset(
        "assets/$title.png",
        scale: 1.5,
      ),
    );
  }
}
