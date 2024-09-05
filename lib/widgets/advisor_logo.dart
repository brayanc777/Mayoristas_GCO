import 'package:flutter/material.dart';

class AdvisorLogo extends StatelessWidget {
  const AdvisorLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.only(top: 50.0),
            width: 110,
            child: Image.asset('lib/assets/images/advisor_image.png')),
        Container(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: const Text(
            'Advisor',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),
          ),
        )
      ],
    );
  }
}
