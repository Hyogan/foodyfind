import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  void openLocationSearchBox(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(
      title : Text("Your location"),
      content: TextFormField(
        decoration: const InputDecoration(hintText: "Search address..."),
      ),
      actions: [
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        )
      ],
    ));
  }
  const MyCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver now", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Text(
                    "Bastos - Yaoundé Cameroun, Rue 4851",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold
                    ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          )
        ],
      ),
    );
  }
}
