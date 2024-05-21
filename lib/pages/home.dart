import 'package:flutter/material.dart';
import 'package:foodyfind/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('HomePage'),),
      drawer: MyDrawer(),
    );
  }
}