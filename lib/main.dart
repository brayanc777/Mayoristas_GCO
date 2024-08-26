import 'package:flutter/material.dart';
import 'package:mayoristas/screens/home.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mayoristas',
      home: 
      //  Home(),
      // const Splash(),
       ReceptPage(),
      // const Login(),
    );
  }
}
