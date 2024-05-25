import 'package:flutter/material.dart';
import 'package:foodyfind/components/my_button.dart';
import 'package:foodyfind/data/models/product.dart';
import 'package:provider/provider.dart';

import '../data/models/restaurants.dart';


class ProductPage extends StatefulWidget {
  final Product product ;
  final Map<Addon,bool> selectedAddons = {};

   ProductPage({
    super.key,
    required this.product,
  }){
    for(Addon addon in product.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {


  void addToCart(Product product, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context);

    //
    List<Addon> currentlySelectedAddons = [];

    for(Addon addon in widget.product.availableAddons) {
      if(widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    context.read<Restaurant>().addToCart(product,currentlySelectedAddons);
}
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              //image of the product
              Image.asset(widget.product.imagePath),

              //Product details
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  //product name
                  Text(widget.product.name, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                  //Product price
                  Text(
                  "Fcfa ${widget.product.price.toString()}",
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.secondary
                  )
                ),

                  //product description
                  Text(
                  widget.product.description,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary
                  )
                ),



                  const SizedBox(height: 10),
                  Divider(color : Theme.of(context).colorScheme.secondary),
                  const SizedBox(height: 10,),
                  Text(
                    "Add ons",
                    style: TextStyle(
                      color : Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    )
                  ),

              //food addons
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color : Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.product.availableAddons.length,
                      itemBuilder: (context,index) {
                        //get individual addon
                        Addon addon = widget.product.availableAddons[index];
                        return CheckboxListTile(
                            title : Text(addon.name),
                            subtitle: Text('Fcfa ${addon.price}',style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                              value: widget.selectedAddons[addon],
                              onChanged: (bool?  value){
                                setState(() {
                                widget.selectedAddons[addon] = value!;
                              });
                            }
                            );
                      }
                    ),
                  )
                ],
              ),
            ),
              //buttons
                MyButton(
                text: "Add to cart",
                onTap: () => addToCart(widget.product,widget.selectedAddons),
                ),

                const SizedBox(height: 25,),
              ],

            ),
          ),
        ),
        SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
                color : Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        )
      ],
    );
  }
}
