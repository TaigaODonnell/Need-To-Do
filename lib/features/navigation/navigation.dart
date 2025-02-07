import 'package:flutter/material.dart';

class Navigation {
  void push(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }

  void pushR(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => page,
    ));
  }
}
