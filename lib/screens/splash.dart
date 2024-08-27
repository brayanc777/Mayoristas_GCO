import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
              Positioned(
                top: -161,
                left: 41,
                height: 385,
                child: Container(
                  width: 401,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'lib/assets/images/background-image.png')))),
              ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                Container(
                    width: 92,
                    height: 33,
                    margin: const EdgeInsets.only(bottom: 25, top: 150),
                    child: Image.asset('lib/assets/images/gco_logo.png'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
