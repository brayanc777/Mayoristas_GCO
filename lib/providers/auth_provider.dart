import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;
  String? _username;
  final DateTime currentDate = DateTime.now();

  String? get token => _token;
  String? get username => _username;
  
  bool get isAuthenticated => _token != null; 

  AuthProvider() {
    _loadAuthData();
  }

  Future<void> _loadAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    _username = prefs.getString('username');
    notifyListeners();
  }

 Future<void> setAuthenticated(String token, String username) async {
  _token = token;
  _username = username;

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
  await prefs.setString('username', username);

  notifyListeners();
}


  void logout() async {
    _token = null;
    _username = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('username');
    notifyListeners();
  }
}
