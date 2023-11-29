import 'package:flutter/material.dart';
import 'package:product_catalog/constants.dart';
import 'package:product_catalog/ui/product_size.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            height: 130,
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Papel',
              style: kBaseTextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 3),
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              children: [
                ProductSize(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'R\$25,00',
              style: kBaseTextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: const Color(0xFF112265)),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductLoadingCard extends StatelessWidget {
  const ProductLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kColorScheme.outline,
      highlightColor: kColorScheme.outlineVariant,
      child: Container(
        margin: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
