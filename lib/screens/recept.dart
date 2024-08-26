import 'package:flutter/material.dart';
import 'package:mayoristas/pages/widgets/bg_image.dart';
import 'package:mayoristas/pages/widgets/reception_detail.dart';
import '../pages/widgets/sid_input.dart';
import '../pages/widgets/plu_input.dart';

class ReceptPage extends StatefulWidget {
  const ReceptPage({super.key});

  @override
  State<ReceptPage> createState() => _ReceptPageState();
}

class _ReceptPageState extends State<ReceptPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/images/background-image.png'))),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SidInput(controller: controller),
                const SizedBox(height: 20),
                const MaterialInput(),
                const SizedBox(height: 20),
                Align(
                  
                  alignment: Alignment.centerLeft,
                  child: Container(
                      width: 150,
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 5.0, top: 2.5, bottom: 2.5),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(217, 217, 217, 1)),
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      child: const Text(
                        'Detalle de la recepcion',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                const SizedBox(height: 5.0),
                const ReceptionDetail(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
