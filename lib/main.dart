//@dart = 2.9
import 'package:flutter/material.dart';
import 'package:trogontest/screen/showscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trogon Test',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ShowScreen(),
    );
  }
}