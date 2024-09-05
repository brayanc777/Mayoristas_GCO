import 'package:flutter/material.dart';
import 'package:mayoristas/widgets/bg_image.dart';
import '../../widgets/advisor_logo.dart';

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
          const Positioned(top: -161, left: 41, height: 385, child: BgImage()),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AdvisorLogo(),
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
