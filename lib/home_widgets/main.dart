import 'package:flutter/material.dart';
import 'package:fluttertipcalculator/home_screens/calculator_home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tip Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TipCalculatorScreen(),
    );
  }
}
