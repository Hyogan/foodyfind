import 'package:flutter/material.dart';


//Display Error message to a user 

void displayMessageToUser(String message,BuildContext context) {
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
                            title: Text(message),
                          )
  );
}