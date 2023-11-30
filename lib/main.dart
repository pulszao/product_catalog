import 'package:flutter/material.dart';
import 'package:product_catalog/controller/categories_controller.dart';
import 'package:product_catalog/controller/products_controller.dart';
import 'package:product_catalog/utils/constants.dart';
import 'package:product_catalog/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsController(), lazy: false),
        ChangeNotifierProvider(create: (_) => CategoriesController(), lazy: false),
      ],
      child: MaterialApp(
        title: 'Catálogo de Produtos',
        theme: ThemeData(
          colorScheme: kColorScheme,
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
