import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Positioned(
              top: -161,
              height: -41,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 401,
                  height: 385,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'lib/assets/images/background-image.png')))),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: 155,
                  child: Image.asset('lib/assets/images/advisor_image.png'),
                ),
                const Text(
                  'Advisor',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 36,
                      color: Color.fromRGBO(25, 8, 87, 1)),
                )
              ],
            ),
            SizedBox(
                width: 92,
                height: 33,
                child: Image.asset('lib/assets/images/gco_logo.png'))
          ],
        )
      ],
    );
  }
}
