import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  const BgImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        foregroundDecoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/images/background-image.png'))),
      ),
    );
  }
}
