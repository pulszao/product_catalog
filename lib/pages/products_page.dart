import 'package:flutter/material.dart';
import 'package:product_catalog/ui/product_card.dart';
import 'package:product_catalog/ui/search_text_field.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          SearchTextField(
            onChanged: (name) {
              // Map data = Provider.of<SignContractProvider>(context, listen: false).getContractsData() ?? {};
              // buildContracts(context, data: data, filterText: name);
            },
            searchController: _searchController,
            hintText: "Pesquisar",
          ),
          const SizedBox(height: 20),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(), // Disable GridView's scrolling
            shrinkWrap: true, // Prevent infinite size error
            crossAxisCount: 2,
            clipBehavior: Clip.none,
            childAspectRatio: 0.75,
            children: const [
              ProductCard(),
              ProductCard(),
              ProductCard(),
              ProductCard(),
              ProductCard(),
              ProductCard(),
            ],
          ),
        ],
      ),
    );
  }
}
