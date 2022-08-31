import 'package:flutter/material.dart';
import 'package:dashboard/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

Widget build(BuildContext context) {
  return MyApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
