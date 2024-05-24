import 'package:flutter/material.dart';
import 'package:foodyfind/data/models/product.dart';


class ProductTile extends StatelessWidget {

  final Product product;
  final void Function()? onTap;

  const ProductTile({
    super.key,
    required this.product,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Row(
                children: [
                  //Text food informations details
                  Expanded(
                      child: Column(
                        crossAxisAlignment : CrossAxisAlignment.start,
                        children: [
                          Text(product.name),
                          Text('Fcfa ${product.price.toInt().toString()}', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                          const SizedBox(height: 10),
                          Text(product.description,style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                        ],
                      )
                  ),
                  const SizedBox(width: 15,),
                  ClipRRect(
                    borderRadius : BorderRadius.circular(20),
                    child: Image.asset(product.imagePath,height: 120,),
                  ),

                ],

              ),
            ),
          ),
        // The divider line
        Divider(
            color: Theme.of(context).colorScheme.primary,
            endIndent : 25,
            indent : 25
        ),
      ],
    );
  }
}
