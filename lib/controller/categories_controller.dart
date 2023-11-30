import 'package:flutter/cupertino.dart';
import 'package:product_catalog/models/category.dart';

class CategoriesController extends ChangeNotifier {
  List<Category> _categories = [];

  List<Category> getCategories() => _categories;

  void setCategories(Map data) {
    _categories = [];
    List<SubCategory> subCategories = [];

    if (data['success']) {
      for (Map product in data['result']['items']) {
        subCategories = [];
        for (Map subCategory in product['subcategorias']) {
          subCategories.add(
            SubCategory(
              id: subCategory['categoriaId'],
              name: subCategory['nome'],
              description: subCategory['descricao'],
              status: subCategory['situacao'],
            ),
          );
        }

        _categories.add(
          Category(
            id: product['id'],
            name: product['nome'],
            description: product['descricao'],
            status: product['situacao'],
            subCategories: subCategories,
          ),
        );
      }
      notifyListeners();
    }
  }
}
