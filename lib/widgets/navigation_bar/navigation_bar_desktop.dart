// ignore_for_file: prefer_final_fields, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, avoid_unnecessary_containers

import 'package:bloodbank/Services/Shared_Preferences.dart';
import 'package:bloodbank/Services/auth.dart';
import 'package:bloodbank/views/Home/home_view.dart';
import 'package:bloodbank/views/AboutScreen/aboutScreen.dart';
import 'package:bloodbank/widgets/navigation_bar/nevbarItam.dart';
import 'package:bloodbank/widgets/navigation_bar/nevbarLogo.dart';
import 'package:flutter/material.dart';

class NavigationBarDesktop extends StatefulWidget {
  const NavigationBarDesktop({Key? key}) : super(key: key);

  @override
  State<NavigationBarDesktop> createState() => _NavigationBarDesktopState();
}

class _NavigationBarDesktopState extends State<NavigationBarDesktop> {
  Size get preferredSize => const Size.fromHeight(100);
  AuthMethods _auth = AuthMethods();
  SharedPreferenceHelper prefs = SharedPreferenceHelper();
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeView()));
                  },
                  child: Container(child: NavBarItem('Home'))),
              SizedBox(
                width: 60,
              ),
              Row(
                children: [
                  name != null
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
                            Icon(Icons.person),
                            SizedBox(
                              width: 5,
                            ),
                            NavBarItem("Profile"),
                          ],
                        ),
                ],
              ),
              SizedBox(
                width: 60,
              ),
              GestureDetector(
                  onTap: () {},
                  child: Container(child: NavBarItem('Contact Us'))),
              SizedBox(
                width: 60,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => aboutScreen()));
                  },
                  child: Container(child: NavBarItem('About'))),
              SizedBox(
                width: 30,
              ),
              PopupMenuButton<int>(
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: (context) => [
                        PopupMenuItem<int>(
                            value: 0,
                            child: Container(
                                alignment: Alignment.center,
                                child: NavBarItem('LogOut')))
                      ]),
              SizedBox(
                width: 30,
              ),
            ],
          )
        ],
      ),
    );
  }

  onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        _auth.signOut();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeView()));
        break;
    }
  }
}
