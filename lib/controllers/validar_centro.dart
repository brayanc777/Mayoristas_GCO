import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mayoristas/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ValidarCentro {
  Future validacionCentro(BuildContext context) async {
    int? codcentro;
    String? caja;
    final token = Provider.of<AuthProvider>(context, listen: false).token;
    try {
      final response = await http.get(
          Uri.parse(
              'http://localhost:8080/recepciones/validar/$codcentro/$caja'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          });
          if(response.statusCode == 200) {
            final responseData = response.body;
            print(responseData);
            return responseData;
          }else{
            print('Response body${response.body}');
            throw Exception('error: ${response.statusCode}');
          }
    } catch (e) {
      print('Error:$e');
      throw Exception('error $e');
    }
  }

}
