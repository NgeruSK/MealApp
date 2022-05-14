import 'package:flutter/material.dart';
import '../screens/favourites_screen.dart';
import '../widgets/content_categories.dart';

import '../models/category_model.dart';
import '../models/meal_model.dart';
class TabsScreen extends StatefulWidget {

  List<Meal> fav_meals;

  TabsScreen(this.fav_meals);


  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(centerTitle: true,toolbarHeight: 30,title: Text('DashBoard'),bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.category),
            text: 'Categories',),
            Tab(icon: Icon(Icons.star),
            text: 'Favourites',)
          ],
        ),),

          body: TabBarView(
            children: [
              CategoriesScreen(),
              FavouritesScreen(widget.fav_meals)

            ],
          )
      ),



    );
  }
}
