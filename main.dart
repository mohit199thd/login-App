
import 'package:MEALaPP/pages/login-signup.dart';


import 'package:flutter/material.dart';


void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      title: ' Meal App',
      home: LoginSignUp(),
    );
  }
}
