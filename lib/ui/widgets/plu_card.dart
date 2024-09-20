import 'package:flutter/material.dart';
import 'package:mayoristas/models/product_model.dart';

class PluCard extends StatefulWidget {
  final ProductModel product;
  final int count;
  final bool isSelected; 
  final ValueChanged<bool> onSelectionChanged;

  const PluCard({
    super.key,
    required this.product,
    required this.count,
    required this.isSelected,
    required this.onSelectionChanged,
  });

  @override
  State<PluCard> createState() => _PluCardState();
}

class _PluCardState extends State<PluCard> {
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
                          child: Text(
                            widget.product.id.toString(),
                            style: const TextStyle(
                              fontSize: 14, 
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'x ${widget.count} Und.',
                            style: const TextStyle(
                              fontSize: 14, 
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${widget.product.descripcion},${widget.product.codRef}, ${widget.product.talla}, ${widget.product.color}',
                            style: const TextStyle(
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
