/// ignore_for_file: prefer_final_fields, await_only_futures, unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names, avoid_unnecessary_containers, use_key_in_widget_constructors, sized_box_for_whitespace, avoid_print, file_names
// ignore_for_file: prefer_final_fields, await_only_futures, unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names, avoid_unnecessary_containers, use_key_in_widget_constructors, sized_box_for_whitespace, avoid_print, file_names, camel_case_types, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:bloodbank/views/FormScreens/FormContentDesktop.dart';
import 'package:bloodbank/views/FormScreens/FormContentMobileTablet.dart';
import 'package:bloodbank/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Data_form extends StatelessWidget {
  const Data_form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        appBar: Navigation_Bar(),
        backgroundColor: Colors.white,
        body: ScreenTypeLayout(
          mobile: FormContentMobileTablet(),
          desktop: FormContentDesktop(),
        ),
      ),
    );
  }
}
