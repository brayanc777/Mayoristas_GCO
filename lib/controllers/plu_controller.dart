// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:mayoristas/models/plu_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

// import '../providers/auth_provider.dart';

// List<ProductModel> products = [];

// Future<ProductModel> getPlu(BuildContext context) async {
//   final token = Provider.of<AuthProvider>(context, listen: false).token;
//   try {
//     final response = await http.get(
//       Uri.parse('http://localhost:8080/productos'),
//       headers: {
//         'Authorization': '$token',
//       },
//     );
//     if (response.statusCode == 200) {
//       final productData = jsonDecode(response.body);
//       return productData;
//     } else {
//       throw Exception('Error ${response.statusCode}');
//     }
//   } catch (e) {
//     throw Exception('Error $e');
//   }
// }
