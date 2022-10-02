// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:bloodbank/views/Home/home_content_desktop.dart';
import 'package:bloodbank/views/Home/home_content_mobile.dart';
import 'package:bloodbank/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // SharedPreferenceHelper prefs = SharedPreferenceHelper();
  // String? user;
  // onscreenload() async {
  //   user = (await prefs.getEmail())!;
  // }

  // @override
  // void initState() {
  //   onscreenload();
  //   print("I am user ${user}");
  //   super.initState();
  // }

  bool check = true;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        appBar: Navigation_Bar(),
        backgroundColor: Colors.white,
        body: ScreenTypeLayout(
          mobile: HomeContentMobile(),
          desktop: HomeContentDesktop(),
        ),
      ),
    );
  }
}
