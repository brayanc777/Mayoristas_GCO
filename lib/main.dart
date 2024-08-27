import 'package:flutter/material.dart';
import 'package:mayoristas/screens/home.dart';
import 'package:go_router/go_router.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
final GoRouter _router = GoRouter(routes: [
GoRoute(path: '/',
builder: (context, state) {
  return const Home();
},
)
]);

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
       routerConfig: _router,
       title: 'Mayoristas',
      );
  }
}
