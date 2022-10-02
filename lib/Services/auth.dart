// ignore_for_file: non_constant_identifier_names, unused_local_variable, no_leading_underscores_for_local_identifiers, unnecessary_new, unnecessary_null_comparison

import 'package:bloodbank/Services/DataBase.dart';
import 'package:bloodbank/Services/Shared_Preferences.dart';
import 'package:bloodbank/views/Home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final SharedPreferenceHelper pref = SharedPreferenceHelper();

  getCurrentUser() async {
    final GoogleSignIn _googleSignIn = new GoogleSignIn();
    return await _googleSignIn.isSignedIn();
  }

  signInWithGoogle(BuildContext context) async {
    String? FullName,
        DOB,
        BloodGroup,
        profileUrl,
        ContactNo,
        LastBloodDonationDate,
        Address,
        City;
    await pref.getFullName().then((value) => FullName = value);
    await pref.getDOB().then((value) => DOB = value);
    await pref.getBloodGroup().then((value) => BloodGroup = value);
    await pref.getContactNo().then((value) => ContactNo = value);
    await pref
        .getLastBloodDonationDate()
        .then((value) => LastBloodDonationDate = value);
    await pref.getAddress().then((value) => Address = value);
    await pref.getCity().then((value) => City = value);
    final GoogleSignIn _googleSignIn = new GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result = await _auth.signInWithCredential(credential);
    User? userDetails = result.user;
    if (result == null) {
    } else {
      pref.saveEmail(userDetails!.email.toString());
      pref.saveprofileUrl(userDetails.photoURL.toString());

      Map<String, dynamic> UserInfoMapGoogle = {
        "FullName": FullName,
        "email": userDetails.email,
        "DOB": DOB,
        "BloodGroup": BloodGroup,
        "ContactNo": ContactNo,
        "LastBloodDonationDate": LastBloodDonationDate,
        "Address": Address,
        "City": City,
        "profileUrl": userDetails.photoURL
      };
      const Center(child: CircularProgressIndicator());
      DatabaseMethods().addUserInfoToDB(UserInfoMapGoogle).then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeView()));
      });
    }
  }

  Future signOut() async {
    final GoogleSignIn _googleSignIn = new GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signOut();
    await pref.deletePrefs();
  }
}
