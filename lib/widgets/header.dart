import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final username = context.watch<AuthProvider>().username;
    return Scaffold(
      drawer: Drawer(
        child: Container(
          margin: const EdgeInsets.only(bottom: 66),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: TextButton(child: const Text('Administrador'),
                onPressed: () {
                  context.go('/admin');
                })
              ),

              TextButton(
                onPressed: () {
                  context.read<AuthProvider>().logout();
                  context.go('/login');
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Cerrar secion', style: TextStyle(color: Colors.red),),
                    Icon(Icons.logout, color: Colors.red,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('$username'),
      ),
    );
  }
}
