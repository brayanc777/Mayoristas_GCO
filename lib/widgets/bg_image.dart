import 'package:flutter/material.dart';


class BgImage extends StatelessWidget {
  const BgImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 401,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'lib/assets/images/background-image.png'))));
  }
}
