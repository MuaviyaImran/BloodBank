// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, unnecessary_new, avoid_unnecessary_containers, file_names

import 'package:bloodbank/Services/Shared_Preferences.dart';
import 'package:bloodbank/Services/auth.dart';
import 'package:bloodbank/widgets/input_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FormContentMobileTablet extends StatefulWidget {
  const FormContentMobileTablet({Key? key}) : super(key: key);

  @override
  State<FormContentMobileTablet> createState() =>
      _FormContentMobileTabletState();
}

class _FormContentMobileTabletState extends State<FormContentMobileTablet> {
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
    return new AlertDialog(
      content: new Column(
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
                color: Color.fromARGB(255, 62, 157, 235),
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 28, right: 28, top: 20),
                child: Text(
                  "It should only take a couple of minutes to Sign in to your account. Let's get you set up.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 46, 129, 197),
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  elevation: 5.0,
                  child: SingleChildScrollView(
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                top: 15.0,
                                right: 20.0,
                                left: 20.0,
                                bottom: 10.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      "Personal Information Form",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 46, 129, 197),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text_Form("Full Name", "Full Name", FullName),
                                  Text_Form("Date of birth", "01/01/1990",
                                      DateofBirth),
                                  Text_Form(
                                      "Contact No", "03*********", ContactNo),
                                  Text_Form("Blood Group",
                                      "A+ A- B+ B- O+ O- AB+ AB-", Bloodgroup),
                                  Text_Form("Last Blood Donation Date ",
                                      "Month / Year", LastBloodDonationDate),
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
                                          "I agree that all the Information \nentered is true",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 46, 129, 197)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
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
                                        child: Center(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 8),
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 46, 129, 197),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Text(
                                              "Submit",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
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
            ],
          ),
        ),
      ),
    );
  }
}
