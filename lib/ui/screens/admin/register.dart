import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mayoristas/controllers/auth_controller.dart';
import 'package:mayoristas/ui/widgets/password_input.dart';
import 'package:mayoristas/ui/widgets/user_input.dart';
import 'package:mayoristas/widgets/advisor_logo.dart';
import 'package:mayoristas/widgets/bg_image.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _stateForm = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? selectedRole;
  String result = '';
  String error = '';

  final AuthController authController = AuthController();

  Future<void> _registerUser() async {
    final username = usernameController.text;
    final password = passwordController.text;
    final role = selectedRole;

    final result = await authController.register(username, password, role);

    setState(() {
      this.result = result;
    });

    if (username == usernameController.text) {
      print('este usuario ya existe');
    }

    if (result.startsWith('Usuario creado:')) {
      context.go('/');
    } else {
      print(result);
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
      ),
    );

    const inputTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );

    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 245, 255, 1),
      body: Stack(
        children: [
          const Positioned(top: 25, left: 41, height: 401, child: BgImage()),
          Container(
            padding: const EdgeInsets.only(top: 125.0),
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
                        inputDecoration: inputDecoration,
                      ),
                      const SizedBox(height: 8.0),
                      PasswordInput(
                        inputTextStyle: inputTextStyle,
                        passwordController: passwordController,
                        inputDecoration: inputDecoration,
                      ),
                      const SizedBox(height: 8.0),
                      SizedBox(
                        width: 228,
                        height: 41,
                        child: DropdownButtonFormField<String>(
                          value: selectedRole,
                          decoration: inputDecoration.copyWith(
                            hintText: 'Seleccione un Rol',
                            hintStyle: const TextStyle(height: 3.0),
                          ),
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
                              return 'Almenos un rol es requerido';
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
                              _registerUser();
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
                const AdvisorLogo()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
