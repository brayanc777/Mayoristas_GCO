import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void setAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }

  void authenticatedTrue() {
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout(BuildContext context) {
    _isAuthenticated = false;
    notifyListeners();
    context.go('/login');
  }
}
