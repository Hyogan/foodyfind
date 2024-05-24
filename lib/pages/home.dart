import 'package:flutter/material.dart';
import 'package:foodyfind/components/my_current_location.dart';
import 'package:foodyfind/components/my_description_box.dart';
import 'package:foodyfind/components/my_drawer.dart';
import 'package:foodyfind/components/my_product_tile.dart';
import 'package:foodyfind/components/my_sliver_app_bar.dart';
import 'package:foodyfind/components/my_tab_bar.dart';
import 'package:foodyfind/data/models/product.dart';
import 'package:foodyfind/data/models/restaurants.dart';
import 'package:provider/provider.dart';


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
    _tabController = TabController(length: ProductCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //Sort out and return a list of food items that belong to a specific category
  List<Product> _filterMenuByCategory(ProductCategory category, List<Product> fullMenu) {
    return fullMenu.where((product) => (product.category == category)).toList();
  }

  //return a list of product linked to the given category

  List<Widget> getFoodInThisCategory(List<Product> fullMenu) {
    return ProductCategory.values.map((category) {

      //Get category menu
      List<Product> categoryMenu = _filterMenuByCategory(category, fullMenu);

      //get
      return ListView.builder(
        itemCount : categoryMenu.length,
        physics : const NeverScrollableScrollPhysics(),
        padding : EdgeInsets.zero,
        itemBuilder : (context,index) {

          //get individual product and return it as a widget
          final product = categoryMenu[index];
          return ProductTile(product: product , onTap: (){},);
        },
      );
    }).toList();
}

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
        [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //My actual location
                Divider(
                  indent: 40,
                  endIndent: 25,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .secondary,
                ),
                //my current location
                const MyCurrentLocation(),
                //description box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) =>
              TabBarView(
                controller: _tabController,
                children: getFoodInThisCategory(restaurant.menu),
              ),
        ),
      ),
    );
  }
}