// ignore_for_file: prefer_final_fields, await_only_futures, unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names, avoid_unnecessary_containers, use_key_in_widget_constructors, sized_box_for_whitespace, avoid_print, file_names

import 'package:bloodbank/Services/DataBase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DonorsContentMobileTablet extends StatefulWidget {
  @override
  State<DonorsContentMobileTablet> createState() =>
      _DonorsContentMobileTabletState();
}

class _DonorsContentMobileTabletState extends State<DonorsContentMobileTablet> {
  Stream<QuerySnapshot>? donorStream;
  DatabaseMethods _dataBase = DatabaseMethods();

  Widget donorListTile(String? Address, BloodGroup, City, ContactNo, DOB,
      FullName, LastBloodDonationDate, email, profileUrl) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
          child: Column(
            children: [
              Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          padding: EdgeInsets.only(
                              left: 25, right: 25, top: 10, bottom: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(75.0),
                            child: Image.network(
                              profileUrl,
                              height: 150.0,
                              width: 150.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Name : ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    " " + FullName + "   ",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 28, 141, 233)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Contact # : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    " " + ContactNo + "   ",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 28, 141, 233)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Date of Birth : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    " " + DOB + "   ",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 28, 141, 233)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Blood Group : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    " " + BloodGroup + "   ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Last Blood Donation Date : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                  Text(
                                    " " + LastBloodDonationDate + "   ",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 28, 141, 233)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Address : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    " " + Address! + "   ",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 28, 141, 233)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "City : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    " " + City + "   ",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 28, 141, 233)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
                child: Container(color: Colors.grey[50]),
              )
            ],
          ),
        ));
  }

  Widget getDonorsList() {
    return StreamBuilder<QuerySnapshot>(
      stream: donorStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            print("I am in Error State in donnor Screen");
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            return ListView.builder(
                padding: EdgeInsets.only(bottom: 70, top: 16),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data!.docs[index];

                  return donorListTile(
                      ds["Address"],
                      ds["BloodGroup"],
                      ds["City"],
                      ds["ContactNo"],
                      ds["DOB"],
                      ds["FullName"],
                      ds["LastBloodDonationDate"],
                      ds["email"],
                      ds["profileUrl"]);
                });
          } else {
            return Text("Empty Data");
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }

  @override
  void initState() {
    setState(() {});
    donorStream = _dataBase.getDoners();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.grey[50],
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200),
          child: Center(
            child: Container(
              width: 800,
              color: Colors.white,
              child: getDonorsList(),
            ),
          ),
        ),
      ),
    );
  }
}
