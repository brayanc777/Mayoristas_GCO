import 'package:flutter/material.dart';

class MaterialInput extends StatelessWidget {
  const MaterialInput({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                height: 1.4,
                textBaseline: TextBaseline.alphabetic,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 8),
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
              decoration: const InputDecoration(
                labelText: 'Escanee el EAN o PLU',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
