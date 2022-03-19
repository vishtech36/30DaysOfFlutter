import 'dart:ffi';

import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/login_page.dart';
import 'package:demo/utils/MyRoutes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
/*
* Author : Vishwajeet Barve
* 19-03-2022
*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily),
      color: Colors.white,
      darkTheme: ThemeData.dark(),
      initialRoute: MyRoutes.home,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.home: (context) => const HomePage(),
        MyRoutes.login: (context) => const LoginPage()
      },
    );
  }
}
