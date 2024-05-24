import 'package:flutter/cupertino.dart';

import 'product.dart';
class Restaurant extends ChangeNotifier{
  // List of products menu

  final List<Product>  _menu = [
    Product(
        id: 1,
        name: "Taro sauce jaune",
        price: 2600,
        sellingType : SellingType.plate,
        description: 'A well cooked achu plate with yellow sauce, tree meat parts and fish part',
        imagePath: 'lib/images/taro_sauce_jaune.jpg',
        category: ProductCategory.main_food,
        availableAddons: [
          Addon(name: "beef_meats", price: 300),
          Addon(name: "legumes", price: 100)
        ]
    ),
    Product(
        id: 2,
        name: "Fried plantain",
        price: 1000,
        sellingType : SellingType.plate,
        description: 'A well fried platain extra',
        imagePath: 'lib/images/fries_plantain.jpg',
        category: ProductCategory.fast,
        availableAddons: [
          Addon(name: "extra sauce", price: 200),
          Addon(name: "eggs", price: 1000)
        ]
    ),
    Product(
        id: 1,
        name: "Taro sauce jaune",
        price: 2600,
        sellingType : SellingType.plate,
        description: 'A well cooked achu plate with yellow sauce, tree meat parts and fish part',
        imagePath: 'lib/images/taro_sauce_jaune.jpg',
        category: ProductCategory.main_food,
        availableAddons: [
          Addon(name: "beef_meats", price: 300),
          Addon(name: "legumes", price: 100)
        ]
    ),
    Product(
        id: 1,
        name: "Taro sauce jaune",
        price: 2600,
        sellingType : SellingType.plate,
        description: 'A well cooked achu plate with yellow sauce, tree meat parts and fish part',
        imagePath: 'lib/images/taro_sauce_jaune.jpg',
        category: ProductCategory.main_food,
        availableAddons: [
          Addon(name: "beef_meats", price: 300),
          Addon(name: "legumes", price: 100)
        ]
    ),
    Product(
        id: 1,
        name: "Taro sauce jaune",
        price: 2600,
        sellingType : SellingType.plate,
        description: 'A well cooked achu plate with yellow sauce, tree meat parts and fish part',
        imagePath: 'lib/images/taro_sauce_jaune.jpg',
        category: ProductCategory.main_food,
        availableAddons: [
          Addon(name: "beef_meats", price: 300),
          Addon(name: "legumes", price: 100)
        ]
    )
  ];


  /*
  * G E T T E R S
  *
  */
  List<Product> get menu => _menu;

  /*
  * O P E R A T I O N S
  *   // ADD TO THE CART
  *
  *   // REMOVE FROM THE CART
  *
  *
  *   // GET TOTAL PRICE OF THE CART
  *
  *   // GET TOTAL NUMBER OF ITEMS IN CART
  *
  *   // CLEAR THE CART
  *
  */

  /*
    * H E L P E R S
    *   // GENERATE A RECEIPT
    *
    *   // FORMAT DOUBLE VALUE INTO MONEY
    *
    *   // FORMAT LIST OF ADDONS INTO STRING SUMMARY
    *
    */
}