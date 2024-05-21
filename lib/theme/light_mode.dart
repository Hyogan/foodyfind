import 'package:flutter/material.dart';


ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Color(0xFFFAFAFA),
    primary:  Color(0xFFFB8C00),
    secondary: Color(0xFB8C00),
    inversePrimary: Color(0xFFFB8C00),
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor:const  Color(0xFF333333),
    displayColor: const  Color(0xFF333333),
  )
);



// L  "primary": "#FFA726",
//   "secondary": "#FB8C00",
//   "inversePrimary": "#FFFFFF",
//   "bodyColor": "#FAFAFA",
//   "displayColor": "#333333"
// }


// ThemeData lightMode = ThemeData(
//   brightness: Brightness.light,
//   colorScheme: ColorScheme.light(
//     background: Colors.grey.shade300,
//     primary: Colors.grey.shade200,
//     secondary: Colors.grey.shade400,
//     inversePrimary: Colors.grey.shade600,
//   ),
//   textTheme: ThemeData.light().textTheme.apply(
//     bodyColor: Colors.grey[800],
//     displayColor: Colors.black,
//   )
// );