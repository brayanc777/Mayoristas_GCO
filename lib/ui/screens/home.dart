import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mayoristas/widgets/bg_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownvalue = 'option 1';
  final options = [
    'option 1',
    'option 2',
    'option 3',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(top: 48, left: 50, height: 401, child: BgImage()),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: Container(
                //     width: 48,
                //     height: 43,
                //     color: const Color.fromRGBO(247, 245, 255, 1),
                //     child: const IconButton(
                //       color: Colors.black,
                //         onPressed: null, icon: Icon(Icons.view_list_rounded)),
                //   ),
                // ),

                DropdownButton(
                    icon: const Icon(Icons.view_list_rounded),
                    items: options.map((String options) {
                      return DropdownMenuItem(
                          value: options, child: Text(options));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    }),

                Container(
                  height: 66,
                  color: const Color.fromRGBO(247, 245, 255, 1),
                  child: Row(
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
