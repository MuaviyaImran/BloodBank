// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, camel_case_types, file_names, deprecated_member_use, unused_import, unused_local_variable

import 'package:bloodbank/widgets/centered_view/centered_view.dart';
import 'package:bloodbank/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class aboutScreen extends StatefulWidget {
  @override
  State<aboutScreen> createState() => _aboutScreenState();
}

class _aboutScreenState extends State<aboutScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var textAlignment =
          sizingInformation.deviceScreenType == DeviceScreenType.Desktop
              ? TextAlign.left
              : TextAlign.center;
      double titleSize =
          sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ? 5
              : 80;
      double descriptionSize =
          sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ? 9
              : 21;

      return Scaffold(
        appBar: Navigation_Bar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 70.0, vertical: 40),
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: [
                    Container(
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'About',
                            style: TextStyle(
                                fontSize: titleSize, color: Colors.red),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 1100,
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                  'Welcome to Tehzeeb Ul Ikhlaq Blood Bank Every day thousands of people enter the gates of Tehzeeb Ul Ikhlaq Blood Bank (TUIBB) seeking for Blood Donations and ask blood for themselves or their loved ones. With an undying commitment to excellence that meets international standards, regulations and quality systems, we make sure that the patient’s needs are met satisfactorily under a single roof. Tehzeeb Ul Ikhlaq Blood Bankis located in the center of the bustling city of Karachi near the National Cricket Stadium. Owing to this unique location TUIBB has easy access from all quadrants of the city.\nTUIBB was conceived 60 years ago as a not-for-profit organization with a vision to provide quality healthcare at an affordable cost to all socioeconomic classes. Over the years, the hospital has evolved to become the largest tertiary care hospital in the country with more than 700 beds. We also have the largest number of ICU beds and ventilators in the city. The hospital excels in all facets of medicine, surgery, diagnostics and medical support services. LNH houses more than 35 specialties. Considering patient’s care as priority, we provide 24 hour emergency services, acute care, inpatient, outpatient and day care facilities not only to the city but also to patients from the far reaching corners of Sindh, Balochistan, Khyber Pakhtunkhwa and Punjab.',
                                  style: TextStyle(
                                    fontSize: descriptionSize,
                                  ))),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      );
    });
  }
}
