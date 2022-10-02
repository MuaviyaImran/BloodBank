// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, import_of_legacy_library_into_null_safe, unused_import, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CourseDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var textAlignment =
          sizingInformation.deviceScreenType == DeviceScreenType.Desktop
              ? TextAlign.left
              : TextAlign.center;
      double titleSize =
          sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ? 10
              : 80;
      double descriptionSize =
          sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ? 12
              : 21;
      return Container(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tehzeeb-Ul-Ikhlaq\nBlood Bank',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: titleSize,
                  height: 0.9),
              textAlign: textAlignment,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '“Blood Donation Costs You Nothing, But It Can Mean The World To Someone In Need. Donate Blood Because You Never Know How Helpful It Might Be To Someone. Donate Blood So That Other People Are Also Encouraged To Do So.”',
              style: TextStyle(fontSize: descriptionSize, height: 1.7),
              textAlign: textAlignment,
            ),
          ],
        ),
      );
    });
  }
}
