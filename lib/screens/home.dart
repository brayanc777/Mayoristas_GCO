import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 48,
              left: 50,
              height: 401,
              child: Container(
                width: 401,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'lib/assets/images/background-image.png'))),
              )),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 48,
                    height: 43,
                    color: const Color.fromRGBO(247, 245, 255, 1),
                    child: const IconButton(
                      color: Colors.black,
                        onPressed: null, icon: Icon(Icons.view_list_rounded)),
                  ),
                ),
                Container(
                  height: 66,
                  color: const Color.fromRGBO(247, 245, 255, 1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () => context.go('/splash'),
                          icon: const Icon(
                              size: 45,
                              color: Color.fromRGBO(151, 71, 255, 1),
                              Icons.border_outer_rounded)),
                      IconButton(
                          onPressed: () => context.go('/recept'),
                          icon: const Icon(
                              size: 45,
                              color: Color.fromRGBO(151, 71, 255, 1),
                              Icons.qr_code_scanner_rounded)),
                      IconButton(
                          onPressed: () => context.go('/login'),
                          icon: const Icon(
                              size: 45,
                              color: Color.fromRGBO(151, 71, 255, 1),
                              Icons.scatter_plot_outlined)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
