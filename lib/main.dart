import 'package:afric_shop_app/app/features/onboard/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Afric Shop',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorSchemeSeed: const Color(0xFF006D40),
      ),
      home: const WelcomeScreen(),
    );
  }
}
