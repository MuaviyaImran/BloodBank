// ignore_for_file: file_names, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bloodbank/views/DonorScreen/DonorsRecord.dart';
import 'package:bloodbank/views/FormScreens/form.dart';
import 'package:flutter/material.dart';

class JoinButtonBuilder extends StatelessWidget {
  const JoinButtonBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Data_form()));
      },
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Column(
          children: [
            Text(
              "Join Community",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            Text(
              "Login With Google",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 46, 129, 197),
            borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}

class RecordShowButtonBuilder extends StatelessWidget {
  const RecordShowButtonBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DonorsData()));
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Column(
          children: [
            Text(
              "Show Doners",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 46, 129, 197),
            borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
