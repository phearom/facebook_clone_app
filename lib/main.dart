import 'package:facebook_clone_app/screens/navbar_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final customColor = MaterialColor(
    Colors.grey.shade50.value,
    {
      50: Colors.grey.shade50,
      100: Colors.grey.shade100,
      200: Colors.grey.shade200,
      300: Colors.grey.shade300,
      400: Colors.grey.shade400,
      500: Colors.grey.shade500,
      600: Colors.grey.shade600,
      700: Colors.grey.shade700,
      800: Colors.grey.shade800,
      900: Colors.grey.shade900
    },
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook Clone App',
      theme: ThemeData(
        primarySwatch: customColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NavbarScreen(),
    );
  }
}
