import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../providers/authService.dart';
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

  final AuthService _authService = AuthService();

  Future<void> _login() async {
    if (_stateForm.currentState!.validate()) {
      final response = await _authService.login(
        usernameController.text,
        passwordController.text,
      );
      setState(() {
        result = response;
      });

      if (response.startsWith('Welcome')) {
        context.go('/');
      }
    } else {
      setState(() {
        result = 'Formulario no válido';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );

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
                        inputDecoration: inputDecoration,
                      ),
                      const SizedBox(height: 8.0),
                      PasswordInput(
                        inputTextStyle: inputTextStyle,
                        passwordController: passwordController,
                        inputDecoration: inputDecoration,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 32),
                        width: 101,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              const Color.fromRGBO(101, 85, 147, 1),
                            ),
                          ),
                          child: const Text(
                            'Ingresar',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        '¿Olvidaste tu contraseña?',
                        style: inputTextStyle,
                      ),
                      if (result.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        Text(result, style: const TextStyle(color: Colors.red)),
                      ],
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
