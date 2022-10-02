// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:bloodbank/Services/Shared_Preferences.dart';
import 'package:bloodbank/Services/auth.dart';
import 'package:bloodbank/views/Home/HomeviewButtons.dart';
import 'package:bloodbank/widgets/centered_view/centered_view.dart';
import 'package:bloodbank/widgets/course_details/course_details.dart';
import 'package:flutter/material.dart';

class HomeContentDesktop extends StatefulWidget {
  const HomeContentDesktop({Key? key}) : super(key: key);

  @override
  State<HomeContentDesktop> createState() => _HomeContentDesktopState();
}

class _HomeContentDesktopState extends State<HomeContentDesktop> {
  AuthMethods auth = AuthMethods();
  SharedPreferenceHelper prefs = SharedPreferenceHelper();
  String? profileUrl, name;
  getProfile() async {
    profileUrl = await prefs.getprofileUrl();
    name = await prefs.getFullName();
    check = await auth.getCurrentUser();
    setState(() {});
  }

  bool check = false;
  @override
  void initState() {
    setState(() {});
    getProfile();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CenteredView(
      Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Row(children: [
              CourseDetails(),
              Container(
                padding: EdgeInsets.only(left: 230, top: 210),
                child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        JoinButtonBuilder(),
                        SizedBox(
                          height: 5,
                        ),
                        RecordShowButtonBuilder()
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset("assets/images/BloodBank.jpg")
        ],
      ),
    );
  }
}
