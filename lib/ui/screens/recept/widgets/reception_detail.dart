import 'package:flutter/material.dart';
import 'package:mayoristas/ui/screens/recept/widgets/plu_card.dart';

class ReceptionDetail extends StatefulWidget {
  const ReceptionDetail({
    super.key,
  });

  @override
  State<ReceptionDetail> createState() => _ReceptionDetailState();
}

class _ReceptionDetailState extends State<ReceptionDetail> {
  final TextEditingController pluInputController = TextEditingController();



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
              controller: pluInputController,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                hintText: 'Escanee el EAN o PLU',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 317,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 150,
              padding: const EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromRGBO(217, 217, 217, 1)),
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
              ),
              child: const Text(
                'Detalle de la recepcion',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 317,
          height: 366,
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 214, 213, 213),
              width: 1.0,
            ),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 64,
                  height: 63,
                  margin: const EdgeInsets.only(left: 9.0),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(254, 247, 255, 1),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.stars_outlined),
                      SizedBox(width: 8),
                      // Text(
                      //   '${pluById.length}',
                      //   style: const TextStyle(
                      //     fontWeight: FontWeight.w500,
                      //     fontSize: 14,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 9.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(236, 34, 31, 1),
                      minimumSize: const Size(47, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(
                          color: Color.fromRGBO(192, 15, 12, 1),
                          width: 1.0,
                        ),
                      ),
                    ),
                    onPressed: null,
                    child: const Icon(
                      Icons.delete_outline_outlined,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
               
            ListView(
              children: const [
                SizedBox(
                  width: 300,
                  height: double.infinity,
                  child: PluCard())
              ],
            )
                
               
              
          ]),
        ),
      ],
    );
  }
}