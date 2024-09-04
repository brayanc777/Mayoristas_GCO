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
                                      controller: usernameController,
                                      autofocus: true,
                                      style: const TextStyle(),
                                      decoration: inputDecoration,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Usuario es requerido';
                                        }
                                        return null;
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
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: inputDecoration,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Contraseña es requerida';
                                    }
                                    return null;
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
