import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../widgets/advisor_logo.dart';
import '../../widgets/bg_image.dart';
import '../widgets/password_input.dart';
import '../widgets/user_input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _stateForm = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String result = '';

  Future<void> postUser() async {
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
        setState(() {
          result =
              'User name: ${responseData['username']}  Password: ${responseData['password']}';
        });
        // print(responseData);
        print(result);
        // context.go('/');
      } else {
        throw Exception('No se pudo iniciar secion');
      }
    } catch (e) {
      setState(() {
        result = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5.0)));
    const inputTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
    return Scaffold(
        backgroundColor: const Color.fromRGBO(36, 41, 51, 1),
        body: Stack(
          children: [
            const Positioned(top: 25, left: 41, height: 401, child: BgImage()),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
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
//print(result);
                                  if (_stateForm.currentState!.validate()) {
                                    postUser();
                                  } else {
                                    print('Formulario no válido');
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      const Color.fromRGBO(101, 85, 147, 1)),
                                ),
                                child: const Text('Ingresar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0,
                                    )),
                              )),
                          const SizedBox(height: 32),
                          const Text(
                            '¿Olvidaste tu contraseña?',
                            style: inputTextStyle,
                          ),
                        ],
                      )),
                  AdvisorLogo(),
                ],
              ),
            ),
          ],
        ));
  }
}
