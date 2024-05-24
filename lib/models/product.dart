import 'package:foodyfind//models/restaurant.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final double price;

  List<String> tags;


  /*double rate;
  ProductType type;
  Restaurant restaurant;
  String photo;
  List<String>? images = [];*/

  Product({
    required this.id,
    required this.name,
    required this.tags,
    required this.price,
    required this.description,
    required this.imagePath
  });
}

//enum ProductType { FAST, drinks, salads, sides, desserts, cereales, fruits, milky, meat_fish_eggs, }