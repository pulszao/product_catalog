class Product {
  final int id;
  final String name;
  final String description;
  final String additionalDescription;
  final bool status;
  final int categoryId;
  final int subcategoryId;
  final String categoryName;
  final String subcategoryName;
  final int imageQuantity;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.additionalDescription,
    required this.status,
    required this.categoryId,
    required this.subcategoryId,
    required this.categoryName,
    required this.subcategoryName,
    required this.imageQuantity,
    required this.price,
  });
}
