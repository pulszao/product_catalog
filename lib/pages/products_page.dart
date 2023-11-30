import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_catalog/controller/products_controller.dart';
import 'package:product_catalog/models/product.dart';
import 'package:product_catalog/services/products/get_products.dart';
import 'package:product_catalog/ui/product_card.dart';
import 'package:product_catalog/ui/search_text_field.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  TextEditingController _searchController = TextEditingController();
  List<ProductCard> productsCard = [];
  bool loading = true;

  void getData() async {
    setState(() => loading = true);

    Map products = await getAllProducts();
    if (!mounted) return;
    Provider.of<ProductsController>(context, listen: false).setProducts(products);

    setState(() => loading = false);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    productsCard = Provider.of<ProductsController>(context).getFilteredProductCardWidgets();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            SearchTextField(
              onChanged: (text) {
                List<Product> products = Provider.of<ProductsController>(context, listen: false).getProducts();
                List<Product> filteredProducts = [];

                for (Product prod in products) {
                  if (prod.name.toLowerCase().contains(text.toLowerCase().trim())) {
                    filteredProducts.add(prod);
                  }
                }
                Provider.of<ProductsController>(context, listen: false).setFilteredProducts(filteredProducts);
              },
              searchController: _searchController,
              hintText: "Pesquisar",
            ),
            const SizedBox(height: 20),
            !loading && productsCard.isEmpty
                ? Column(
                    children: [
                      const SizedBox(height: 40),
                      SvgPicture.asset(
                        'images/ant_no_data.svg',
                        height: 55,
                      ),
                      const Text('Nenhum produto encontrado'),
                    ],
                  )
                : GridView.count(
                    physics: const NeverScrollableScrollPhysics(), // Disable GridView's scrolling
                    shrinkWrap: true, // Prevent infinite size error
                    crossAxisCount: 2,
                    clipBehavior: Clip.none,
                    childAspectRatio: 0.75,
                    children: loading
                        ? const [
                            ProductLoadingCard(),
                            ProductLoadingCard(),
                            ProductLoadingCard(),
                            ProductLoadingCard(),
                            ProductLoadingCard(),
                            ProductLoadingCard(),
                          ]
                        : productsCard,
                  ),
          ],
        ),
      ),
    );
  }
}
