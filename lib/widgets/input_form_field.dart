// ignore_for_file: prefer_final_fields, await_only_futures, unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names, avoid_unnecessary_containers, use_key_in_widget_constructors, sized_box_for_whitespace, avoid_print, file_names, prefer_typing_uninitialized_variables, camel_case_types, prefer_const_constructors_in_immutables, unnecessary_string_interpolations, unnecessary_null_comparison, body_might_complete_normally_nullable

import 'package:flutter/material.dart';

class Text_Form extends StatelessWidget {
  final String label;
  final String content;
  final Controller;

  Text_Form(this.label, this.content, this.Controller);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 100.0,
              child: Text(
                "$label",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.lightBlue),
              ),
            ),
            SizedBox(
              width: 40.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.7,
              color: Colors.blue[50],
              child: TextFormField(
                validator: (val) {
                  if (val!.isEmpty || val == null) {
                    return "Please Enter $label";
                  }
                  if (label == "Full Name" && val.length < 6) {
                    return "Full Name Must be Greater then 6";
                  }
                  if (label == "Contact No" &&
                      (val.length > 11 || val.length < 11)) {
                    return "Contact No is invalid";
                  }
                  if (label == "Blood Group") {
                    if (val.length < 2 || val.length > 3) {
                      return "Enter Blood Group in Proper Format";
                    }
                  }
                },
                controller: Controller,
                style: TextStyle(
                  fontSize: 15.0,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue.shade50,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue.shade50,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "$content",
                  fillColor: Colors.blue[50],
                ),
              ),
            ),
            SizedBox(height: 60)
          ],
        );
      },
    );
  }
}
