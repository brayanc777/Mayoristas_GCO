import 'package:flutter/material.dart';

class PluCard extends StatefulWidget {
  const PluCard({super.key});

  @override
  State<PluCard> createState() => _PluCardState();
}

class _PluCardState extends State<PluCard> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(
          color: Color.fromRGBO(217, 217, 217, 1),
          width: 1.0,
        ),
      ),
      child: Container(
        width: 299,
        height: 91,
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '11111118934723',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  height: 22.4 / 14.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'x X Und.',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  height: 22.4 / 14.0,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 02),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Text(
                                'Pantalo',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  height: 22.4 / 12.0,
                                  color: Color.fromRGBO(117, 117, 117, 1),
                                ),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                'A785C',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  height: 22.4 / 12.0,
                                  color: Color.fromRGBO(117, 117, 117, 1),
                                ),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                'Talla L',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  height: 22.4 / 12.0,
                                  color: Color.fromRGBO(117, 117, 117, 1),
                                ),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                'Rojo',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  height: 22.4 / 12.0,
                                  color: Color.fromRGBO(117, 117, 117, 1),
                                ),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
           Positioned(
  top: 10,
  right: -3.0,
  child: SizedBox(
    width: 36,
    height: 36,
    child: Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 24,
        height: 24,
        child: Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
      ),
    ),
  ),
)

          ],
        ),
      ),
    );
  }
}
