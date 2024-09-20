import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextButton(onPressed: null, child: Text('Cerrar secion')),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<AuthProvider>().logout(context);
              //  print(context.watch<AuthProvider>().isAuthenticated.toString());
              },
            ),
            const TextButton(onPressed: null, child: Text('Cerrar secion'))
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('username'),
      ),
    );
  }
}
