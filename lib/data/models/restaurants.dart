
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodyfind/data/models/cart_item.dart';

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
  List<CartItem> get cart => _cart;

  /*
  * O P E R A T I O N S
  *
  */

  // CREATE A USER CART
    final List<CartItem> _cart = [];
  // // ADD TO THE CART

      void addToCart(Product  product, List<Addon> selectedAddons) {
         // find if there is a cart item already with the same food and selected addons
        CartItem? cartItem = _cart.firstWhereOrNull((item) {
          //check if the food items are the same
          bool isSameProduct = item.product == product;
            //check if the list of selected addons are the same
          bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);

          return isSameProduct && isSameAddons;
        });

        if (cartItem != null) {
          cartItem.quantity++;
        }

        //otherwise, add a new cart item
        else {
          _cart.add(CartItem(product: product, selectedAddons: selectedAddons));
        }
        notifyListeners();
      }

      //Remove from the cart
      void removeFromCart(CartItem cartItem) {
        int cartIndex = _cart.indexOf(cartItem);

        if(cartIndex != -1) {
          if(_cart[cartIndex].quantity > 1) {
            _cart[cartIndex].quantity--;
          }else {
            _cart.removeAt(cartIndex);
          }
        }
        notifyListeners();
      }


   // GET TOTAL PRICE OF THE CART
    double getTotalPrice() {
        double total = 0.0;

        for(CartItem cartItem in _cart ) {
            double itemTotal = cartItem.product.price;

            for(Addon addon in  cartItem.selectedAddons) {
              itemTotal += addon.price;
            }

            total += itemTotal * cartItem.quantity;
        }

        return total;
    }

   // GET TOTAL NUMBER OF ITEMS IN CART

    int getTotalItemCount() {
      int totalItemCount = 0 ;
      for(CartItem cartItem in _cart) {
        totalItemCount += cartItem.quantity;
      }

      return totalItemCount;
    }


   // CLEAR THE CART

    void clearCart() {
        _cart.clear();
        notifyListeners();
    }



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