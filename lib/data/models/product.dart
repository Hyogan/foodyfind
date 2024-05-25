class Product {
  final int id;
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final SellingType sellingType ;
  final ProductCategory category;
  List<Addon> availableAddons;

  /*double rate;
  List<String> tags;
  ProductType type;
  Restaurant restaurant;
  String photo;
  List<String>? images = [];*/

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.category,
    required this.availableAddons,
    required this.sellingType
  });
}

enum SellingType {
  litters,
  kg,
  plate,
  bottle
}
enum ProductCategory
{
  main_food,
  fast,
  drinks,
  salads,
  desserts,
  milky,
  Sugars_and_sweets,
  Beverages,
  Spices_and_condiments,
  Fruits_and_vegetables
}
//Oils_and_fats, fruits, milky, meat_fish_eggs,Legumes,Dairy_products

class Addon{
  String name;
  double price;

  Addon({
    required this.name,
    required this.price}
      );
}