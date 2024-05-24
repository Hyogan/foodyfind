import 'package:flutter/material.dart';


class MyTabBar extends StatelessWidget {

  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TabBar(
          controller: tabController,
          tabs: const [

            //1 first tab
            Tab(
              icon: Icon(Icons.home),
            ),

            //2 second tab
            Tab(
              icon: Icon(Icons.settings),
            ),

            //3 second tab
            Tab(
              icon: Icon(Icons.person),
            )
          ],
        ),
    );
  }
}
