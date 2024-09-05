import 'package:flutter/material.dart';

class SidInput extends StatefulWidget {
  final TextEditingController controller;

  const SidInput({super.key, required this.controller});

  @override
  State<SidInput> createState() => _SidInputState();
}

class _SidInputState extends State<SidInput> {
final TextEditingController clearController = TextEditingController();

void clearSidInput() {
clearController.clear();
}

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
            controller: clearController,
            decoration: InputDecoration(
              labelText: '    CAJA',
              labelStyle: const TextStyle(
                color: Color.fromRGBO(73, 69, 79, 1),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: IconButton(
                onPressed: clearSidInput,
                icon: const Icon(
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
            'Seleccione el caja que desea recepcionar',
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}