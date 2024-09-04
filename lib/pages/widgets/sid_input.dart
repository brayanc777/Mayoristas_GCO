import 'package:flutter/material.dart';

class SidInput extends StatefulWidget {
  final TextEditingController controller;

  const SidInput({super.key, required this.controller});

  @override
  State<SidInput> createState() => _SidInputState();
}

class _SidInputState extends State<SidInput> {
  final TextEditingController sidController = TextEditingController();
  final TextEditingController clearController = TextEditingController();

  void clearSidInput() {
    clearController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      //padding: const EdgeInsets.only(left: 15.0),
      margin: const EdgeInsets.only(top: 26),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(230, 224, 233, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      child: TextFormField(
        autofocus: true,
        controller: clearController,
        decoration: InputDecoration(
          helperText:  'Seleccione la caja que desea recepcionar',
          labelText: '$sidController',
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
    );
  }
}
