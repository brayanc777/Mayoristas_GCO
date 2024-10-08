import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ReceptController extends StatefulWidget {
 const ReceptController({super.key});

  @override
  State<ReceptController> createState() => _ReceptControllerState();
}

class _ReceptControllerState extends State<ReceptController> {
   bool isChecked = false;
  String result = '';
  final TextEditingController sidController = TextEditingController();
  final TextEditingController cajaController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();

  Future postReception() async{
   try {
     final response = await http.post(
      Uri.parse('http://localhost:8080/recepciones?=1'),
            headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'sid': String,
          'caja': int,
          'confirmacion': String,
          'cantidad': int,
          'medida': String,
          'fechadoc': String,
          'centro':{
            'id': int,
            'codigo': String,
            'bp': String,
            'nit': int,
            'nombre': String,
            'direccion': String,
            'email': String,
            'telefono': String,
            'estado': Char
          },
          'user':{
            'id': int,
            'username': String,
            'password': String,
            'isEnabled': bool,
            'accountNoExpired': bool,
            'accountNoLocked': bool,
            'credentialNoExpired': bool
          }
        })
      );

      if(response.statusCode == 201){
        final responseData = jsonDecode(response.body);
        setState(() {
          result = 'Recepcion exitosa!!! $responseData';
        });
       //print(responseData);
      }else {
        throw Exception('Algo fallo durante la recepcion');
      }
   }catch(e) {
    setState(() {
      result = 'Error $e';
    });
   }

  }

  @override
  Widget build(BuildContext context) {
    return Container(

    

    );
  }
}