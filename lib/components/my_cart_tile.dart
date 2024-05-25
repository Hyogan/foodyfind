import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyfind/components/my_quantity_selector.dart';
import 'package:foodyfind/data/models/cart_item.dart';
import 'package:foodyfind/data/models/restaurants.dart';
import 'package:provider/provider.dart';


class MyCartTile extends StatelessWidget {
  final CartItem cartItem ;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context,restaurant,child) => Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal:25, vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                //food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                      child: Image.asset(cartItem.product.imagePath,height: 100, width: 100,)
                  ),
                //food name in price
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartItem.product.name),
                    Text(cartItem.product.price.toString())
                  ],
                ),

                //increment or decrement quantity
                QuantitySelector(
                    product: cartItem.product,
                    onDecrement: (){restaurant.removeFromCart(cartItem);},
                    onIncrement: (){restaurant.addToCart(cartItem.product, cartItem.selectedAddons) ;},
                    quantity: cartItem.quantity
                )
              ],
            ),
          ),
          SizedBox(
            height: cartItem.selectedAddons.isEmpty ? 0 : 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: cartItem.selectedAddons
                .map(
                  (addon) => FilterChip(
                      label: Row(
                        children: [
                          //addon name
                          Text(addon.name),
                          Text(addon.price.toString())
                          //addon price
                        ],
                      ),
                      onSelected: (value) {},
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,fontSize: 12),
                  ),
                ).toList(),
            ),
          )

        ],
      ),
    ));
  }
}
