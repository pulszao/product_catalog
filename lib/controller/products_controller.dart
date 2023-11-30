import 'package:flutter/cupertino.dart';
import 'package:product_catalog/models/product.dart';
import 'package:product_catalog/ui/product_card.dart';

class ProductsController extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _filteredProducts = [];

  List<Product> getProducts() => _products;

  List<Product> getFilteredProducts() => _filteredProducts;

  void setProducts(Map data) {
    _products = [];
    if (data['success']) {
      for (Map product in data['result']['items']) {
        _products.add(
          Product(
            id: product['id'],
            name: product['nome'],
            description: product['descricao'],
            additionalDescription: product['descricaoAdicional'],
            status: product['situacao'],
            categoryId: product['categoriaId'],
            subcategoryId: product['subcategoriaId'],
            categoryName: product['categoriaNome'],
            subcategoryName: product['subcategoriaNome'],
            imageQuantity: product['filesQuantity'],
            price: product['precoAtual'],
          ),
        );
      }
      _filteredProducts = _products;
      notifyListeners();
    }
  }

  void setFilteredProducts(List<Product> data) {
    _filteredProducts = data;
    notifyListeners();
  }

  List<ProductCard> getProductCardWidgets() {
    List<ProductCard> cards = [];
    for (Product product in _products) {
      cards.add(ProductCardWidget(product: product));
    }
    return cards;
  }

  List<ProductCard> getFilteredProductCardWidgets() {
    List<ProductCard> cards = [];
    for (Product product in _filteredProducts) {
      cards.add(ProductCardWidget(product: product));
    }
    return cards;
  }
}
