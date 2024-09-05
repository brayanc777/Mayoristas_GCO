import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowUserName extends StatelessWidget {
  final String username;
  const ShowUserName({super.key, required this.username});

  Future <void> getUserName() async {
    final response = await http.get(Uri.parse('http://localhost:8080/auth/login'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}