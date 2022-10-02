// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, file_names

import 'package:bloodbank/views/DonorScreen/Donors_content_Desktop.dart';
import 'package:bloodbank/views/DonorScreen/Donors_content_MobileTablet.dart';
import 'package:bloodbank/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DonorsData extends StatefulWidget {
  @override
  State<DonorsData> createState() => _DonorsDataState();
}

class _DonorsDataState extends State<DonorsData> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
            appBar: Navigation_Bar(),
            backgroundColor: Colors.white,
            body: ScreenTypeLayout(
                mobile: DonorsContentMobileTablet(),
                desktop: DonorsContentDesktop())));
  }
}
