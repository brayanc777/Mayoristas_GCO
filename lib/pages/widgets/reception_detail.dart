import 'package:flutter/material.dart';
import 'plu_card.dart';

class ReceptionDetail extends StatelessWidget {
  const ReceptionDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 317,
      height: 380,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 214, 213, 213),
          width: 1.0,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 64,
                height: 63,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(254, 247, 255, 1),
                ),
                child: const Text(
                  '5',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                width: 47,
                height: 40,
                padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(236, 34, 31, 1),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: const Color.fromRGBO(192, 15, 12, 1),
                    width: 1.0,
                  ),
                ),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: const [
                PluCard(),
                PluCard(),
                PluCard(),
                PluCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
