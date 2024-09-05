import 'package:flutter/material.dart';
import 'package:mayoristas/ui/widgets/reception_detail.dart';
import 'package:mayoristas/widgets/bg_image.dart';
import '../widgets/sid_input.dart';

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
      body: Stack(
        children: [
          const Positioned(top: 193, left: 50, height: 385, child: BgImage()),
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SidInput(controller: controller),
                  const SizedBox(height: 10.0),
                  const ReceptionDetail(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
