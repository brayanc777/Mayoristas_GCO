import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mayoristas/models/product_model.dart';

class ProductsProvider {
  final baseUrl = Uri.parse('http://localhost:8080/productos');

  Future<ProductModel> productById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        final productData = jsonDecode(response.body);
        return ProductModel.fromJson(productData);
      } else {
        throw Exception('Error ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error... $e');
    }
  }
}
