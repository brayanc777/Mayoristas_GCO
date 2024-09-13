import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.result,
  });

  final String result;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: 48,
            height: 43,
            color: const Color.fromRGBO(247, 245, 255, 1),
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.view_list_rounded, color: Color.fromRGBO(36, 41, 51, 1)),
              onSelected: (value) {
                switch((value)) {
                  case 'splash 1':
                  Navigator.pushNamed(context, '/splash');
                  break;
                  case 'splash 2':
                  Navigator.pushNamed(context, '/splash');
                  break;
                  case 'splash 3':
                  Navigator.pushNamed(context, '/splash');
                  break;
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'splash 1',
                  child: Text('splash 1'),
                ),
                const PopupMenuItem<String>(
                  value: 'splash 2',
                  child: Text('splash 2'),
                ),
                const PopupMenuItem<String>(
                  value: 'splash 3',
                  child: Text('splash 3'),
                ),
              ],
            ),
          ),
        ),
        Text(
          result,
        ),
      ],
    );
  }
}
