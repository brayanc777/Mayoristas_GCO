import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mayoristas/providers/auth_provider.dart';
import 'package:mayoristas/providers/reception_provider.dart';
import 'package:provider/provider.dart';

class CentroByUser extends StatefulWidget {
  const CentroByUser({super.key});

  @override
  State<CentroByUser> createState() => _CentroByUserState();
}

class _CentroByUserState extends State<CentroByUser> {
  List<Map<String, dynamic>> centros = [];
  String? selectedCentroId; 

  @override
  void initState() {
    super.initState();
    getCentros();
  }

  Future<void> getCentros() async {
    final token = Provider.of<AuthProvider>(context, listen: false).token;
    final username = Provider.of<AuthProvider>(context, listen: false).username;
    final url = Uri.parse('http://localhost:8080/centros/username/$username');

    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState(() {
          centros = List<Map<String, dynamic>>.from(responseData);
        });
      } else {
 print('Error: ${response.body}');
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
    
      print('Error: $e');
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seleccionar Centro')),
      body: Center(
        child:
     
          Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton<String>(
                        value: selectedCentroId,
                        hint: const Text('Selecciona un centro'),
                        items: centros.map((centro) {
                          return DropdownMenuItem<String>(
                            value: centro['id'].toString(),
                            child: Text(centro['nombre']),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCentroId = newValue;
                          });
                 
                          final centroSeleccionado = centros.firstWhere((centro) => centro['id'].toString() == newValue);
                          final nombreCentro = centroSeleccionado['nombre'];
                          final codCentro = centroSeleccionado['codigo'];

                         
                          Provider.of<ReceptionProvider>(context, listen: false)
                              .seleccionarCentro(nombreCentro, centroSeleccionado['id'], codCentro);
                        },
                      ),
                      const SizedBox(height: 20),
                      if (selectedCentroId != null)
                        Text('Centro seleccionado: $selectedCentroId'),
                    ],
                  ),
      ),
    );
  }
}
