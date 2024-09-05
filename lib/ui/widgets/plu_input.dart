import 'package:flutter/material.dart';

class PluInput extends StatefulWidget {
  PluInput({
    super.key,
  });

  final TextEditingController pluInputController = TextEditingController();

  @override
  State<PluInput> createState() => _PluInputState();
}

class _PluInputState extends State<PluInput> {
  List<dynamic> pluList = [];

  final List<dynamic> pluById = [];

  void addCardById(String id) {
    final pluIndex = pluById.indexWhere((plu) => plu['Id'] == id);

    setState(() {
      if (pluIndex != -1) {
        pluById[pluIndex]['count']++;
      } else {
        final plu = pluList.firstWhere(
          (plu) => plu['Id'] == id,
          orElse: () => null,
        );
        if (plu != null) {
          pluById.add({...plu, 'count': 1});
        }
      }
    });

    widget.pluInputController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 300,
          height: 22,
          child: Text(
            'Material',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 300,
          height: 40,
          padding: const EdgeInsets.only(left: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color.fromARGB(255, 214, 213, 213),
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: TextFormField(
              controller: widget.pluInputController,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                hintText: 'Escanee el EAN o PLU',
                border: InputBorder.none,
              ),
              onFieldSubmitted: addCardById,
            ),
          ),
        ),
      ],
    );
  }
}
