import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
         decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/images/background-image.png'))),

                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: 360,
                  height: 66,
                  color: const Color.fromRGBO(247, 245, 255, 1),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: () {
                        Navigator.push(context, route)
                      }, icon: Icon(Icons.abc_outlined))
                    ],
                  ),
                ),
    );
  }
}