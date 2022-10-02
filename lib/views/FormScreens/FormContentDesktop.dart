// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_final_fields

import 'package:bloodbank/Services/Shared_Preferences.dart';
import 'package:bloodbank/Services/auth.dart';
import 'package:bloodbank/widgets/input_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FormContentDesktop extends StatefulWidget {
  const FormContentDesktop({Key? key}) : super(key: key);

  @override
  State<FormContentDesktop> createState() => _FormContentDesktopState();
}

class _FormContentDesktopState extends State<FormContentDesktop> {
  List<DropdownMenuItem<String>> get genderdropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(value: "Male", child: Text("Male")),
      DropdownMenuItem(value: "Female", child: Text("Female")),
    ];
    return menuItems;
  }

  Future addUserInfoToDB(Map<String, dynamic> UserInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(UserInfoMap['name'])
        .set(UserInfoMap);
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController FullName = TextEditingController();
  TextEditingController DateofBirth = TextEditingController();
  TextEditingController ContactNo = TextEditingController();
  TextEditingController LastBloodDonationDate = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController City = TextEditingController();
  TextEditingController Bloodgroup = TextEditingController();
  bool _value = false;
  String? GenderValue, bloodGroup;
  SharedPreferenceHelper prefs = SharedPreferenceHelper();

  AuthMethods _auth = AuthMethods();
  SignInWithGoogle(context) async {
    await _auth.signInWithGoogle(context);
  }

  saveDataToLocalStorage() {
    prefs.saveFullName(FullName.text);
    prefs.saveDOB(DateofBirth.text);
    prefs.saveLastBloodDonationDate(LastBloodDonationDate.text);
    prefs.saveAddress(Address.text);
    prefs.saveCity(City.text);
    prefs.saveBloodGroup(Bloodgroup.text);
    prefs.saveContactNo(ContactNo.text);
  }

  formSubmit() {
    if (formKey.currentState!.validate()) {
      saveDataToLocalStorage();
      SignInWithGoogle(context);
      setState(() {});
    }
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      //title: const Text('Popup example'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Column(
              children: [Text("Please check the Box")],
            ),
          ),
        ],
      ),
      actions: <Widget>[
        GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 46, 129, 197),
              ),
              padding: EdgeInsets.only(right: 5, bottom: 5),
              child: Text(" Close"),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding:
            EdgeInsets.only(top: 60.0, bottom: 60.0, left: 120.0, right: 120.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          elevation: 5.0,
          child: SingleChildScrollView(
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.lightBlue[600],
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 85.0, right: 50.0, left: 50.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 60.0,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: Text(
                                "Let's get you set up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: Text(
                                "It should only take a couple of minutes to Sign in to your account",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 15.0, right: 70.0, left: 70.0, bottom: 10.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Personal Information Form",
                              style: TextStyle(
                                color: Color.fromARGB(255, 46, 129, 197),
                                fontWeight: FontWeight.w600,
                                fontSize: 35.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text_Form("Full Name", "Full Name", FullName),
                          Text_Form("Date of birth", "01/01/1990", DateofBirth),
                          Text_Form("Contact No", "03*********", ContactNo),
                          Text_Form("Blood Group", "A+ A- B+ B- O+ O- AB+ AB-",
                              Bloodgroup),
                          Text_Form("Last Blood Donation Date ", "Month / Year",
                              LastBloodDonationDate),
                          Text_Form("Address", "Area / Town", Address),
                          Text_Form("City", "Your City Name", City),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Checkbox(
                                value: _value,
                                onChanged: (newValue) {
                                  setState(() {
                                    _value = newValue!;
                                  });
                                },
                              ),
                              Container(
                                child: Text(
                                  "I agree that all the Information entered is true",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.lightBlue),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 170.0,
                              ),
                              GestureDetector(
                                  onTap: (() {
                                    if (_value) {
                                      formSubmit();
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _buildPopupDialog(
                                          context,
                                        ),
                                      );
                                    }
                                  }),
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 8),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 46, 129, 197),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                        ),
                                      )))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
