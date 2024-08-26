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
        side: BorderSide(color: Colors.grey[300]!, width: 1.0),
      ),
      child: SizedBox(
        width: 299,
        height: 91,
        child: Stack(
          children: [
             const Center(
              child: SizedBox(
                width: 251,
                height: 52,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text('11111118934723',
                                style: TextStyle(fontSize:  14, fontWeight: FontWeight.w600))),
                        Expanded(
                            child: Text('x 200 Und.',
                                style: TextStyle(fontSize:  14, fontWeight: FontWeight.w600))),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Expanded(
                            child: Text('Info',
                                style:
                                    TextStyle(fontSize:  16, fontWeight:  FontWeight.w400, color:  Colors.grey))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 26,
              right: 30,
              child: Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
