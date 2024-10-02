import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mayoristas/controllers/validar_centro.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../../providers/auth_provider.dart';

class CajaInput extends StatefulWidget {
  final TextEditingController controller;

  const CajaInput({super.key, required this.controller});

  @override
  State<CajaInput> createState() => _CajaInputState();
}

class _CajaInputState extends State<CajaInput> {
  final TextEditingController cajaController = TextEditingController();

  void clearSidInput() {
    cajaController.clear();
  }

  Future<void> validacionCentro() async {
    int? codcentro;
    final token = Provider.of<AuthProvider>(context, listen: false).token;
    try {
      final response = await http.get(
          Uri.parse(
              'http://localhost:8080/recepciones/validar/5011/$cajaController'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          });
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData);
        print('Response body${responseData}');
      } else {
        print('Response body: ${response.body}');
        print(response.statusCode);
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error:$e');
      throw Exception('error $e');
    }
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
            onFieldSubmitted: (value) => validacionCentro(),
            autofocus: true,
            controller: cajaController,
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
            'Seleccione la caja que desea recepcionar',
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.start,
          ),
        )
      ],
    );
  }
}
