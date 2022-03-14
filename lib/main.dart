//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:habit_app/model/onboard_data.dart';
import './views/pages.dart';

//import 'screen.dart';
import 'views/onboarding_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit App',
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ),

        primarySwatch: Colors.blue,
      ),
      //home: OnBoardingPage(),
      home: OnBoardingPage(),
    );
  }
}

