import 'package:flutter/material.dart';

class MaterialInput extends StatelessWidget {
  const MaterialInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 300,
          height: 22,
          child: Text(
            'Material',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 300,
          height: 40,
          padding: const EdgeInsets.only(left: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color.fromARGB(255, 214, 213, 213),
              width: 1.0,
            ),
          ),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
            hintText: 'Escanee el EAN o PLU',
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
