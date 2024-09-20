import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthController {
  Future login(String username, String password) async {
    final baseUrl = Uri.parse('http://localhost:8080/auth/login');
    try {
      final response = await http.post(
        baseUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return '${responseData['username']}';
      } else {
        return 'la repuesta no fue exitosa';
      }
    } catch (e) {
      return 'Error: $e';
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
        return 'Error:error ${response.statusCode}, El usuario ya existe o las credenciales no son validas';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
