import 'package:flutter/material.dart';
import 'package:product_catalog/constants.dart';

class ProductSize extends StatelessWidget {
  const ProductSize({super.key});

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
        'Papel',
        style: kBaseTextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}
