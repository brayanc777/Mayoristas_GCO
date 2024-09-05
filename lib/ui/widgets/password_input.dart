import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
    required this.inputTextStyle,
    required this.passwordController,
    required this.inputDecoration,
  });

  final TextStyle inputTextStyle;
  final TextEditingController passwordController;
  final InputDecoration inputDecoration;

  @override
  Widget build(BuildContext context) {
        const inputTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Contraseña',
        style: inputTextStyle,
        ),
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
    );
  }
}
