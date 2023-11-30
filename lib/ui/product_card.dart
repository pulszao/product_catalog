import 'package:flutter/material.dart';
import 'package:product_catalog/utils/constants.dart';
import 'package:product_catalog/models/product.dart';
import 'package:product_catalog/ui/product_size.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';

abstract class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return buildContent(context);
  }
}

class ProductCardWidget extends ProductCard {
  final Product product;
  const ProductCardWidget({super.key, required this.product});

  @override
  Widget buildContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                height: 130,
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  'images/papel.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              if (product.imageQuantity > 0)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 7),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: const Color(0xFFBFC6C8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '+${product.imageQuantity} imagens',
                    style: kBaseTextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              product.categoryName,
              overflow: TextOverflow.ellipsis,
              style: kBaseTextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 3),
          Container(
            alignment: Alignment.topLeft,
            child: Wrap(
              children: [
                ProductSize(
                  label: product.subcategoryName,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              NumberFormat("#,##0.00", "pt_BR").format(product.price),
              style: kBaseTextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: const Color(0xFF112265)),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductLoadingCard extends ProductCard {
  const ProductLoadingCard({super.key});

  @override
  Widget buildContent(BuildContext context) {
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
