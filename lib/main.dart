import 'package:eat_more/pages/bottomnav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eat More App',
      theme: ThemeData(),
      home: const BottomNav(),
    );
  }
}
