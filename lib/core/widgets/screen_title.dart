import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  const ScreenTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 100, 0, 0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
