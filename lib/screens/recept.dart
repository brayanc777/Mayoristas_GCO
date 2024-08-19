import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Recept extends StatefulWidget {
  const Recept({super.key});

  @override
  State<Recept> createState() => _ReceptionState();
}

class _ReceptionState extends State<Recept> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );

    const inputDecoration = InputDecoration(
      labelStyle: textStyle,
      border: InputBorder.none,
    );

    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
          color: const Color.fromARGB(255, 214, 213, 213), width: 1.0),
    );
    return Container(
      width: double.infinity,
      height: double.maxFinite,
      margin: const EdgeInsets.all(10.0),
      child: Container(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 15.0),
                decoration: boxDecoration,
                width: 300,
                height: 53,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller,
                      decoration: inputDecoration.copyWith(
                        labelText: 'SID',
                        suffixIcon: IconButton(
                          onPressed: controller.clear,
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                    ),
                    Container(
                        width: 300,
                        height: 20,
                        child: const Text(
                            'Seleccione el SID que desea recepcionar'))
                  ],
                )),
            Container(
              width: 300,
              height: 70,
              child: Column(
                children: [
                  const SizedBox(
                    width: 300,
                    height: 22,
                    child: Text('Material'),
                  ),
                  const SizedBox(height: 8),
                  Container(
                      width: 300,
                      height: 40,
                      padding: const EdgeInsets.only(left: 16.0),
                      decoration: boxDecoration,
                      child: TextFormField(
                        decoration: inputDecoration.copyWith(
                            labelText: 'Escane el EAN o PLU'),
                      ))
                ],
              ),
            ),
            Container(child: ReseptionDetailList())
          ],
        ),
      ),
    );
  }
}

class ReseptionDetailList extends StatelessWidget {
  const ReseptionDetailList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 317,
      height: 376,
      child: Container(
        child: Column(
          children: [
            Container(
              child: const Row(
                children: [
                 decor
                  Icon(Icons.delete, )
                  ]),
            ),
            // Container(
            //   child: ListView(children: [
            //      PluCard(),
            //   ]
               
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class PluCard extends StatelessWidget {
  const PluCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: 
      Container(child:
      Row(children: [
        Container(),
        Container(
        ),
      ],)
        
        
      ),
    );
  }
}