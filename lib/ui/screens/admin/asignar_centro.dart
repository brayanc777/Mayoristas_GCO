import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final centroId = TextEditingController();
  final usuarioId = TextEditingController();

  Future<void> asignarCentro(BuildContext context) async {
    final url = 'http://localhost:8080/centrousuario/asignar/${centroId.text}/${usuarioId.text}';
    final token = Provider.of<AuthProvider>(context, listen: false).token;

    final Map<String, int> body = {
      'ctr_id': int.parse(centroId.text),
      'user_id': int.parse(usuarioId.text),
    };

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print('Asignacion exitosa.');
      } else {
        print('Error: ${response.body}');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asignar un centro a un usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: centroId,
              decoration: const InputDecoration(labelText: 'centro (ID)'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: usuarioId,
              decoration: const InputDecoration(labelText: 'usuario (ID)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => asignarCentro(context),
              child: const Text('Asignar'),
            ),
          ],
        ),
      ),
    );
  }
}
