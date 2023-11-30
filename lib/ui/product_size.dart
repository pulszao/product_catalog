import 'package:flutter/material.dart';
import 'package:product_catalog/utils/constants.dart';

class ProductSize extends StatelessWidget {
  final String label;

  const ProductSize({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFBFC6C8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: kBaseTextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}
