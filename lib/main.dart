import 'dart:ffi';

import 'package:demo/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const int days = 30;
    const String name = "Vishwajeet";

    return const MaterialApp(home: HomePage());
  }
}
