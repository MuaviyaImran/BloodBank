// ignore_for_file: prefer_final_fields, use_key_in_widget_constructors, camel_case_types, must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors, file_names

import 'package:bloodbank/Services/auth.dart';
import 'package:bloodbank/views/Home/home_view.dart';
import 'package:bloodbank/widgets/navigation_bar/nevbarItam.dart';
import 'package:flutter/material.dart';

class navDrawer extends StatelessWidget {
  AuthMethods _auth = AuthMethods();
  onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        _auth.signOut();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeView()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
        onSelected: (item) => onSelected(context, item),
        itemBuilder: (context) => [
              PopupMenuItem<int>(
                  value: 0, child: Container(child: NavBarItem('LogOut')))
            ]);
  }
}
