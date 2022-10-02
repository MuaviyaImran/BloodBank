// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, import_of_legacy_library_into_null_safe, unused_import, sized_box_for_whitespace, camel_case_types, avoid_unnecessary_containers, prefer_final_fields, must_be_immutable, unused_field

import 'package:bloodbank/Services/auth.dart';
import 'package:bloodbank/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:bloodbank/widgets/navigation_bar/navigation_bar_desktop.dart';
import 'package:bloodbank/widgets/navigation_bar/navigation_bar_tablet.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Navigation_Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);
  AuthMethods _auth = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(),
      desktop: NavigationBarDesktop(),
      tablet: NavigationBarTablet(),
    );
  }
}
