import 'package:fire99/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:fire99/login.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
       debugShowCheckedModeBanner: false,
    );
  }
}
