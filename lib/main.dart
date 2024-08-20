import 'package:flutter/material.dart';
import 'package:mayoristas/screens/recept.dart';
import 'package:mayoristas/screens/login.dart';
import 'package:mayoristas/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mayoristas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Login(),
    );
  }
}
