import 'package:flutter/material.dart';
import 'package:foodyfind/components/my_current_location.dart';
import 'package:foodyfind/components/my_description_box.dart';
import 'package:foodyfind/components/my_drawer.dart';
import 'package:foodyfind/components/my_sliver_app_bar.dart';
import 'package:foodyfind/components/my_tab_bar.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context,innerBoxIsScrolled) =>  [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //My actual location
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  //my current location
                  MyCurrentLocation(),
                  //description box
                  MyDescriptionBox(),
                ],
              ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context,index) => Text("Hello nelson"),
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context,index) => Text("hello john"),
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context,index) => Text("hello henry"),
            ),
          ],
        ),
      ),
    );
  }
}