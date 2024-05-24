import 'package:flutter/material.dart';


class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {

    final TextStyle myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary
    );

    final TextStyle mySecondaryTextStyle = TextStyle(
        color: Theme.of(context).colorScheme.primary
    );


    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8)
      ),
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      child: const  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery fees
            Column(
              children: [
                Text("500Fcfca"),
                Text("Delivery Fee")
              ],
            ),
          //delivery time
          Column(
            children: [
              Text("15-30 min"),
              Text("Delivery Time")
            ],
          )
        ],
      ),
    );
  }
}
