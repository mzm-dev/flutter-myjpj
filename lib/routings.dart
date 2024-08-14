import 'package:flutter/material.dart';

class Routings {
  static onTapLink(BuildContext context, page) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => page));
  }
}
