// ignore_for_file: unused_import, non_constant_identifier_names, avoid_print, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseMethods {
  addUserInfoToDB(Map<String, dynamic> UserInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(UserInfoMap['FullName'])
        .set(UserInfoMap);
  }

  Stream<QuerySnapshot> getDoners() {
    return FirebaseFirestore.instance.collection("users").snapshots();
  }
}
