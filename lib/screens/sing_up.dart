import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _stateForm = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? selectedRole;
  String result = '';

  Future<void> postUser() async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': usernameController.text,
          'password': passwordController.text,
          'roleRequest': {
            'roleListName': [selectedRole],
          },
        }),
      );

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        setState(() {
          result = 'Usuario creado: ${responseData['username']}';
        });
        print(responseData);
//context.go('/');
      } else {
        throw Exception('No se pudo registrar');
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
        contentPadding: const EdgeInsets.all(8.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5.0),
        ));

    const inputTextStyle = TextStyle(
     color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );

    return Scaffold(
      backgroundColor:  const Color.fromRGBO(247, 245, 255, 1),
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
                  image: AssetImage('lib/assets/images/background-image.png'),
                ),
              ),
            ),
          ),
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
                          const Text('Cree un nuevo usuario',
                              style: inputTextStyle),
                          SizedBox(
                            width: 228,
                            height: 41,
                            child: TextFormField(
                              controller: usernameController,
                              autofocus: true,
                              decoration: inputDecoration,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Usuario es requerido';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Cree una contraseña',
                              style: inputTextStyle),
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
                      const SizedBox(height: 8.0),
                      SizedBox(
                        width: 228,
                        height: 41,
                        child: DropdownButtonFormField<String>(
                          value: selectedRole,
                          decoration: inputDecoration.copyWith(
                              hintText: 'Seleccione un Rol',
                              hintStyle: const TextStyle(height: 3.0)),
                          items: <String>[
                            'Admin',
                            'User',
                            'Invited',
                            'Developer'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedRole = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Rol es requerido';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 32),
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_stateForm.currentState!.validate()) {
                              postUser();
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
                            'Registrarse',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextButton(
                        onPressed: () {
                          context.go('/login');
                        },
                        child: const Text(
                          '¿Ya tienes una cuenta? Inicia sesión',
                          style: inputTextStyle,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 50.0),
                      width: 110,
                      child: Image.asset('lib/assets/images/advisor_image.png'),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: const Text(
                        'Advisor',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
