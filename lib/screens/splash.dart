import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: 401,
            height: 385,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('lib/assets/images/background-image.png')))),
                        Image.asset('lib/assets/images/advisor_image.png'),
         SizedBox(
          width: 92,
          height: 33,
          child: 
         Image.asset('lib/assets/images/gco_logo.png'))
      ],
    );
  }
}
