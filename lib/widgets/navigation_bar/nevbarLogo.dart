// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 300,
      child: Image.asset('assets/images/logo.jpeg'),
    );
  }
}
