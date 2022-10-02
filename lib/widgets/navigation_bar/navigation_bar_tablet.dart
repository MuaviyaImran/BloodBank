// ignore_for_file: override_on_non_overriding_member, prefer_final_fields, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_brace_in_string_interps, prefer_const_literals_to_create_immutables

import 'package:bloodbank/Services/Shared_Preferences.dart';
import 'package:bloodbank/Services/auth.dart';
import 'package:bloodbank/views/Home/home_view.dart';
import 'package:bloodbank/views/AboutScreen/aboutScreen.dart';
import 'package:bloodbank/widgets/navigation_bar/nevbarItam.dart';
import 'package:bloodbank/widgets/navigation_bar/nevbarLogo.dart';
import 'package:flutter/material.dart';

class NavigationBarTablet extends StatefulWidget {
  const NavigationBarTablet({Key? key}) : super(key: key);

  @override
  State<NavigationBarTablet> createState() => _NavigationBarTabletState();
}

class _NavigationBarTabletState extends State<NavigationBarTablet> {
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
      height: 110,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 30),
            child: PopupMenuButton<int>(
                color: Colors.blue,
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
                                ? Row(
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
                                  )
                                : Row(
                                    children: [
                                      NavBarItem("Profile"),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(Icons.person),
                                    ],
                                  ),
                          )),
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
          NavBarLogo(),
        ],
      ),
    );
  }
}
