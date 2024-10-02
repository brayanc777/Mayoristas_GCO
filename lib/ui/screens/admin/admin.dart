import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => __AdminScreenState();
}

class __AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextButton(onPressed: () {
        context.go('/admin/singUp');
      }, child: const Text('Crear usuario')),

     TextButton(onPressed: () {
        context.go('/admin/asignarCentro');
      }, child: const Text('Asignar un centro a un usuario')),

    ],);
  }
}