import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class AuthController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> postUser(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': usernameController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        String token = responseData['jwt'];
        String username = responseData['username'];

        Provider.of<AuthProvider>(context, listen: false)
            .setAuthenticated(token, username);
        context.go('/');
        return responseData['jwt'];
      } else {
        print(response.statusCode);
        print('Error: ${response.body}');
      }
    } catch (e) {
      print('error: $e');
    }
  }

  Future<String> register(
      String username, String password, String? role) async {
    final baseUrl = Uri.parse('http://localhost:8080/auth/register');
    try {
      final response = await http.post(
        baseUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': username,
          'password': password,
          'roleRequest': {
            'roleListName': [role],
          },
        }),
      );

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        return 'Usuario creado: ${responseData['username']}';
      } else {
        return response.body;
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
