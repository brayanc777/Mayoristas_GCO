import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  const UserInput({
    super.key,
    required this.inputTextStyle,
    required this.usernameController,
    required this.inputDecoration,
  });

  final TextStyle inputTextStyle;
  final TextEditingController usernameController;
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
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Usuario es requerido';
                //   }
                //   return null;
                // }
                )),
      ],
    );
  }
}
