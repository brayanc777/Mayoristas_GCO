import 'package:flutter/material.dart';

class SidInput extends StatelessWidget {
  final TextEditingController controller;

  const SidInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 50,
          margin: const EdgeInsets.only(top: 26),
          decoration: const BoxDecoration(
          color: Color.fromRGBO(230, 224, 233, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: '    SID',
              labelStyle: TextStyle(
                color: Color.fromRGBO(73, 69, 79, 1),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.cancel_outlined,
                  color: Color.fromRGBO(73, 69, 79, 1),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 300,
          height: 18,
          padding: const EdgeInsets.fromLTRB(16, 2, 16, 0),
          child: const Text(
            'Seleccione el SID que desea recepcionar',
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
