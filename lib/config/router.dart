import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mayoristas/screens/home.dart';
import 'package:mayoristas/screens/login.dart';
import 'package:mayoristas/screens/recept.dart';
import 'package:mayoristas/screens/splash.dart';

final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
      routes: [
        GoRoute(
            path: 'recept',
            builder: (BuildContext context, GoRouterState state) {
              return const ReceptPage();
            }),
      ]),
  GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      }),
      GoRoute(path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return const Splash();
      })
]);
