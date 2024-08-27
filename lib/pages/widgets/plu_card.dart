import 'package:flutter/material.dart';

class PluCard extends StatefulWidget {
  final String id;
  final String tipo;
  final String referencia;
  final String talla;
  final String color;
  final int count;
  final bool isSelected;
  final ValueChanged<bool> onSelectionChanged;

  const PluCard({
    Key? key,
    required this.id,
    required this.tipo,
    required this.referencia,
    required this.talla,
    required this.color,
    required this.count,
    required this.isSelected,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  State<PluCard> createState() => _PluCardState();
}

class _PluCardState extends State<PluCard> {
  bool isChecked = false; 

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
            Center(
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
                          child: Text(widget.id,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                        ),
                        Expanded(
                          child: Text('x ${widget.count} Und.',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${widget.tipo}, ${widget.referencia}, ${widget.talla}, ${widget.color}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ),
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
                value: widget.isSelected,
                onChanged: (bool? value) {
                  widget.onSelectionChanged(value ?? false);
                  

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}