import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mayoristas/widgets/bg_image.dart';
import 'package:mayoristas/widgets/header.dart';

import '../../providers/auth_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

AuthProvider authProvider = AuthProvider();
String result = '';

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Header(),
          const Positioned(top: 48, left: 50, height: 401, child: BgImage()),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 66,
                  color: const Color.fromRGBO(247, 245, 255, 1),
                  child:
                      // BottomNavigationBar(
                      //   items: const [
                      //     BottomNavigationBarItem(
                      //         icon: Icon(
                      //             size: 45,
                      //             color: Color.fromRGBO(151, 71, 255, 1),
                      //             Icons.border_outer_rounded)),
                      //     BottomNavigationBarItem(
                      //         icon: Icon(
                      //             size: 45,
                      //             color: Color.fromRGBO(151, 71, 255, 1),
                      //             Icons.qr_code_scanner_rounded)),
                      //     BottomNavigationBarItem(
                      //         icon: Icon(
                      //             size: 45,
                      //             color: Color.fromRGBO(151, 71, 255, 1),
                      //             Icons.scatter_plot_outlined))
                      //   ],
                      // )

                      Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () => context.go('/singUp'),
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
                          onPressed: () => context.go('/splash'),
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
