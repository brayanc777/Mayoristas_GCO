import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mayoristas/ui/screens/admin/admin.dart';
import 'package:mayoristas/ui/screens/admin/asignar_centro.dart';
import 'package:mayoristas/ui/screens/home.dart';
import 'package:mayoristas/ui/screens/login.dart';
import 'package:mayoristas/ui/screens/admin/register.dart';
import 'package:mayoristas/ui/screens/recept/recept.dart';
import 'package:mayoristas/ui/screens/recept/widgets/centro_by_user.dart';
import 'package:mayoristas/ui/screens/splash.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Home();
        }),
    GoRoute(
      path: '/recept',
      builder: (BuildContext context, GoRouterState state) {
        return const ReceptPage();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
    ),
    GoRoute(
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return const Splash();
      },
    ),
    GoRoute(
        path: '/admin',
        builder: (BuildContext context, GoRouterState state) {
          return const AdminScreen();
        },
        routes: [
          GoRoute(
            path: 'singUp',
            builder: (BuildContext context, GoRouterState state) {
              return const Register();
            },
          ),
          GoRoute(
            path: 'asignarCentro',
            builder: (BuildContext context, GoRouterState state) {
              return  UpdatePage();
            },
          ),
        ]),
  ],
 redirect: (context, state) {
  final token = Provider.of<AuthProvider>(context, listen: false).token;
  final isLoggingIn = state.matchedLocation == '/login';

  if (token == null && !isLoggingIn) {
    return '/login';
  }

  if (token != null && isLoggingIn) {
    return '/';
  }

  return null;
}
);
