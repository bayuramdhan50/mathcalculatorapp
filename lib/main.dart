import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MathCalculatorApp());
}

class MathCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
