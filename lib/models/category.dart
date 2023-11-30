class Category {
  final int id;
  final String name;
  final String description;
  final bool status;
  final List<SubCategory> subCategories;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.subCategories,
  });
}

class SubCategory {
  final int id;
  final String name;
  final String description;
  final bool status;

  SubCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
  });
}
