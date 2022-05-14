import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../models/meal_model.dart';
import '../widgets/content_meal_items.dart';

class FavouritesScreen extends StatefulWidget {

   List<Meal> fav_meals;

   FavouritesScreen(this.fav_meals);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {

    late Category? my_category;

    return Scaffold(
      body: widget.fav_meals.isEmpty ? Center(child: Text('You have no favourites yet. Add a Favourite'),) : ListView.builder(itemBuilder: (ctx, index){
        return MealItem(widget.fav_meals[index]);
      }, itemCount: widget.fav_meals.length,),
    );
  }
}
