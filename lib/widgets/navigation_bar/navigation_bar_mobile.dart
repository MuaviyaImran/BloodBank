// ignore_for_file: prefer_const_constructors, prefer_final_fields, override_on_non_overriding_member, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:bloodbank/Services/Shared_Preferences.dart';
import 'package:bloodbank/Services/auth.dart';
import 'package:bloodbank/views/Home/home_view.dart';
import 'package:bloodbank/views/AboutScreen/aboutScreen.dart';
import 'package:bloodbank/widgets/navigation_bar/nevbarItam.dart';
import 'package:bloodbank/widgets/navigation_bar/nevbarLogo.dart';
import 'package:flutter/material.dart';

class NavigationBarMobile extends StatefulWidget {
  const NavigationBarMobile({Key? key}) : super(key: key);

  @override
  State<NavigationBarMobile> createState() => _NavigationBarMobileState();
}

class _NavigationBarMobileState extends State<NavigationBarMobile> {
  @override
  SharedPreferenceHelper prefs = SharedPreferenceHelper();
  AuthMethods _auth = AuthMethods();
  String? profileUrl, name;
  getMProfileUrl() async {
    profileUrl = await prefs.getprofileUrl();
    name = await prefs.getFullName();
  }

  @override
  void initState() {
    getMProfileUrl();
    setState(() {});
    super.initState();
  }

  onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        _auth.signOut();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeView()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => aboutScreen()));
        break;
      case 4:
        _auth.signOut();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeView()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: 90,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20),
            child: PopupMenuButton<int>(
                color: Color.fromARGB(255, 62, 157, 235),
                icon: Icon(Icons.menu),
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                      PopupMenuItem<int>(
                          value: 0,
                          child: Container(
                              alignment: Alignment.center,
                              child: NavBarItem('Home'))),
                      PopupMenuItem<int>(
                        value: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: profileUrl != null
                              ? Center(
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.network(
                                          profileUrl!,
                                          height: 25,
                                          width: 25,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      NavBarItem("${name}"),
                                    ],
                                  ),
                                )
                              : Center(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(Icons.person),
                                      NavBarItem("Profile"),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                      PopupMenuItem<int>(
                          value: 2,
                          child: Container(
                              alignment: Alignment.center,
                              child: NavBarItem('Contact Us'))),
                      PopupMenuItem<int>(
                          value: 3,
                          child: Container(
                              alignment: Alignment.center,
                              child: NavBarItem('About'))),
                      PopupMenuItem<int>(
                          value: 4,
                          child: Container(
                              alignment: Alignment.center,
                              child: NavBarItem('LogOut'))),
                    ]),
          ),
          NavBarLogo()
        ],
      ),
    );
  }
}
