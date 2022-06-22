import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobil_final_project/screens/login.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Programming 2 Final Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
            bodyText1: GoogleFonts.notoSans(color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),
            bodyText2: GoogleFonts.kdamThmor(color: Colors.black, fontSize: 22)),
        primaryColor: Colors.green[700],
      ),
      home: const SignIn(title: 'Home Page'),
    );
  }
}
