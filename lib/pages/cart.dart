import 'package:flutter/material.dart';
import 'package:foodyfind/components/my_cart_tile.dart';
import 'package:foodyfind/data/models/restaurants.dart';
import 'package:provider/provider.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context,restaurant,child) {
          final userCart = restaurant.cart;

          //scaffold ui
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: const Text("Cart"),
            ),
            body: Column(
              children: [
                userCart.isEmpty ? Text("Cart is empty") : Expanded(
                    child: ListView.builder(
                      itemCount: userCart.length,
                      itemBuilder: (context,index){
                        //getting individual cart item
                        final cartItem = userCart[index];
                        return MyCartTile(cartItem: cartItem);
                      }
                    )
                )
              ],
            )
          );

        }
    );
  }
}
