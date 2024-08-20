import 'package:flutter/material.dart';

class SidInput extends StatelessWidget {
  final TextEditingController controller;

  const SidInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 53,
            margin: const EdgeInsets.only(top: 26),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
              border: Border.all(
                color: const Color.fromARGB(255, 214, 213, 213),
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'SID',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: 300,
            height: 20,
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
            child: const Text(
              'Seleccione el SID que desea recepcionar',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
