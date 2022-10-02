// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_final_fields

import 'package:bloodbank/Services/Shared_Preferences.dart';
import 'package:bloodbank/Services/auth.dart';
import 'package:bloodbank/views/Home/HomeviewButtons.dart';
import 'package:bloodbank/widgets/course_details/course_details.dart';
import 'package:flutter/material.dart';

class HomeContentMobile extends StatefulWidget {
  const HomeContentMobile({Key? key}) : super(key: key);

  @override
  State<HomeContentMobile> createState() => _HomeContentMobileState();
}

class _HomeContentMobileState extends State<HomeContentMobile> {
  SharedPreferenceHelper prefs = SharedPreferenceHelper();
  AuthMethods auth = AuthMethods();
  String? profileUrl, name;
  bool check = false;
  getMProfile() async {
    profileUrl = await prefs.getprofileUrl();
    name = await prefs.getFullName();
    check = await auth.getCurrentUser();
  }

  @override
  void initState() {
    setState(() {});
    getMProfile();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 20),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CourseDetails(),
            SizedBox(
              height: 30,
            ),
            JoinButtonBuilder(),
            SizedBox(
              height: 5,
            ),
            RecordShowButtonBuilder(),
            SizedBox(
              height: 20,
            ),
            Image.asset("assets/images/BloodBank.jpg")
          ],
        ),
      ),
    ));
  }
}
