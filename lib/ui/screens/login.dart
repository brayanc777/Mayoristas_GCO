import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:mayoristas/ui/widgets/password_input.dart';
import 'package:mayoristas/ui/widgets/user_input.dart';
import 'package:mayoristas/widgets/advisor_logo.dart';
import 'package:mayoristas/widgets/bg_image.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _stateForm = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
    const inputTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );
    return Scaffold(
      backgroundColor: const Color.fromRGBO(36, 41, 51, 1),
      body: Stack(
        children: [
          const Positioned(top: 25, left: 41, height: 401, child: BgImage()),
          Container(
            padding: const EdgeInsets.only(top: 150),
            width: double.infinity,
            child: ListView(
              children: [
                Form(
                  key: _stateForm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UserInput(
                          inputTextStyle: inputTextStyle,
                          usernameController: usernameController,
                          inputDecoration: inputDecoration),
                      const SizedBox(height: 8.0),
                      PasswordInput(
                          inputTextStyle: inputTextStyle,
                          passwordController: passwordController,
                          inputDecoration: inputDecoration),
                      Container(
                        margin: const EdgeInsets.only(top: 32),
                        width: 101,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_stateForm.currentState!.validate()) {
                               postUser(context);
                            //  Provider.of<AuthController>(context, listen: false).postUser(context);
                            } else {
                              print('Formulario no válido');
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              const Color.fromRGBO(101, 85, 147, 1),
                            ),
                          ),
                          child: const Text(
                            'Ingresar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text('¿Olvidaste tu contraseña?',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                const AdvisorLogo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
