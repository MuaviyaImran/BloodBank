// ignore_for_file: non_constant_identifier_names, file_names, unused_local_variable

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String FullName = "Full Name";
  static String DOB = "DOB";
  static String Email = "Email";
  static String BloodGroup = "Blood Group";
  static String profileUrl = "profileUrl";
  static String ContactNo = "ContactNo";
  static String LastBloodDonationDate = "LastBlood Donation Date";
  static String Address = "Address";
  static String City = "City";
  //save data

  Future<bool> saveFullName(getFullName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(FullName, getFullName);
  }

  Future<bool> saveDOB(getDOB) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(DOB, getDOB);
  }

  Future<bool> saveEmail(getEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(Email, getEmail);
  }

  Future<bool> saveBloodGroup(getBloodGroup) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(BloodGroup, getBloodGroup);
  }

  Future<bool> saveprofileUrl(getprofileUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(profileUrl, getprofileUrl);
  }

  Future<bool> saveContactNo(getContactNo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(ContactNo, getContactNo);
  }

  Future<bool> saveLastBloodDonationDate(getLastBloodDonationDate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(LastBloodDonationDate, getLastBloodDonationDate);
  }

  Future<bool> saveAddress(getAdress) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(Address, getAdress);
  }

  Future<bool> saveCity(getCityName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(City, getCityName);
  }

  //get data from Storage

  Future<String?> getFullName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(FullName);
  }

  Future<String?> getDOB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(DOB);
  }

  Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Email);
  }

  Future<String?> getBloodGroup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(BloodGroup);
  }

  Future<String?> getprofileUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(profileUrl);
  }

  Future<String?> getContactNo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(ContactNo);
  }

  Future<String?> getLastBloodDonationDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(LastBloodDonationDate);
  }

  Future<String?> getAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Address);
  }

  Future<String?> getCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(City);
  }

  Future<Future<bool>> deletePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
