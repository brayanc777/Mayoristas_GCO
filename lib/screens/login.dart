import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _stateForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    postUser();
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String resul = '';

  Future<void> postUser() async {
    try {
      final response =
          await http.post(Uri.parse('http://localhost:8080/auth/login'),
          body: jsonEncode(<String, dynamic>{
            'username': usernameController.value,
            'passwordControler': passwordController,
          })
          );
          if (response.statusCode == 201) {
            final responseDate = jsonDecode(response.body);
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
            Positioned(
                top: 25,
                left: 41,
                height: 401,
                child: Container(
                    width: 401,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'lib/assets/images/background-image.png'))))),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Usuario',
                                style: inputTextStyle,
                              ),
                              SizedBox(
                                  width: 228,
                                  height: 41,
                                  child: TextFormField(
                                      autofocus: true,
                                      style: const TextStyle(),
                                      decoration: inputDecoration,
                                      validator: (value) {
                                        if (value! == 'user') {
                                          return null;
                                        } else {
                                          return 'no pasa';
                                        }
                                      })),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Contraseña', style: inputTextStyle),
                              SizedBox(
                                width: 228,
                                height: 41,
                                child: TextFormField(
                                  //  obscureText: true,
                                  decoration: inputDecoration,
                                  validator: (value) {
                                    if (value! == '123') {
                                      return null;
                                    }
                                    return 'contraseña incorrecta';
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 32),
                              width: 101,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_stateForm.currentState!.validate()) {
                                    context.go('/');
                                    print('Ingresando...');
                                  } else {
                                    print('no paso el formulario');
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
                            '¿Olvidasre tu contraseña?',
                            style: inputTextStyle,
                          ),
                        ],
                      )),
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 50.0),
                          width: 110,
                          child: Image.asset(
                              'lib/assets/images/advisor_image.png')),
                      Container(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: const Text(
                          'Advisor',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
