import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mayoristas/models/plu_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../../providers/auth_provider.dart';

class PluCard extends StatefulWidget {
  const PluCard({super.key});

  @override
  State<PluCard> createState() => _PluCardState();
}

class _PluCardState extends State<PluCard> {
  Future<List<Plu>>? _plus;

  Future<List<Plu>> _getPlus(BuildContext context) async {
    final token = Provider.of<AuthProvider>(context, listen: false).token;
    try {
      final response = await http.get(
        Uri.parse('http://localhost:8080/productos'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        if (responseData.isEmpty) {
          throw Exception('No data received');
        }
        return responseData.map((json) => Plu.fromJson(json)).toList();
      } else {
        print('Response body: ${response.body}');
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    _plus = _getPlus(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.amber,
      child: FutureBuilder<List<Plu>>(
        future: _plus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          }
      
          final plus = snapshot.data!;
      
          return ListView.builder(
            itemCount: plus.length,
            itemBuilder: (context, index) {
              final pluItem = plus[index];
              return SizedBox(
                width: 299,
                height: 91,
                child: Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.grey[300]!, width: 1.0),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          color: Colors.red,
                          width: 251,
                          height: 52,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      pluItem.id.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Text(
                                      'x 1 Und.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${pluItem.descripcion}, ${pluItem.codRef}, ${pluItem.talla}, ${pluItem.color}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 26,
                        right: 30,
                        child: Checkbox(
                          value: false,
                          onChanged: (bool? value) {
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
