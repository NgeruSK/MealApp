import 'dart:ffi';

import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../widgets/content_meal_items.dart';
import '../dummy_data.dart';
import '../models/category_model.dart';
import '../models/meal_model.dart';

class CategoryMealScreen extends StatefulWidget {

  static const routeName = '/category-meals';

  List<Meal> AVAILABLE_MEALS;

  CategoryMealScreen(this.AVAILABLE_MEALS);

  @override
  State<StatefulWidget> createState() {
    return _CategoryMealState();
  }
}
class _CategoryMealState extends State<CategoryMealScreen>
{

  @override
  Widget build(BuildContext context) {

    bool loaded_init_date = false;
    late List<Meal> all_meals;
    late Category? my_category;
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, Category>;
    my_category = routeArgs['category'];
    all_meals = widget.AVAILABLE_MEALS.where((element){
      return element.categories.contains(my_category!.id);
    }).toList();

    void removeItem(String item_id)
    {
      print('here $item_id');
      setState(() {
        all_meals.removeWhere((element){
          return element.id == item_id;
        });
      });
    }
    return Scaffold(
        appBar: AppBar(title: Text(my_category!.title)),
        body: ListView.builder(itemBuilder: (ctx, index){
          return MealItem(all_meals[index]);
        }, itemCount: all_meals.length,),
    );
  }
}
