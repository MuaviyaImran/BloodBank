// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:bloodbank/views/Home/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //name: 'BloodBank',
      options: const FirebaseOptions(
          apiKey: "AIzaSyBHYh7pFkcPOI_xWBP2w3rAcrmPNbVBLuY",
          authDomain: "bloodbank-629df.firebaseapp.com",
          projectId: "bloodbank-629df",
          storageBucket: "bloodbank-629df.appspot.com",
          messagingSenderId: "615453607574",
          appId: "1:615453607574:web:f4eb4ff430d07574b824b7"));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Theme.of(context).textTheme.apply(
                  fontFamily: 'Open Sans',
                )),
        home: HomeView());
  }
}
