import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mayoristas/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:mayoristas/ui/screens/home.dart';
import 'package:mayoristas/ui/screens/login.dart';
import 'package:mayoristas/ui/screens/register.dart';
import 'package:mayoristas/ui/screens/splash.dart';
import 'package:mayoristas/ui/screens/recept.dart';

final GoRouter router = GoRouter(
  routes: [
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
          },
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
    ),
    GoRoute(
      path: '/singUp',
      builder: (BuildContext context, GoRouterState state) {
        return const Register();
      },
    ),
    GoRoute(
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return const Splash();
      },
    ),
  ],
  redirect: (context, state) {
    final isAuthenticated =
        Provider.of<AuthProvider>(context, listen: true).isAuthenticated;
    final isLoggingIn = state.matchedLocation == '/login';

    if (!isAuthenticated && !isLoggingIn) {
      return '/login';
    }

    if (isAuthenticated && isLoggingIn) {
      return '/';
    }

    return null;
  },
);
