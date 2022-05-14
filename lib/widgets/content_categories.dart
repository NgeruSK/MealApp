import 'package:flutter/material.dart';
import '../models/meal_model.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';
import '../models/category_model.dart';
class CategoriesScreen extends StatelessWidget {


  CategoriesScreen();

  List<Category> my_categories = DUMMY_CATEGORIES;


  @override
  Widget build(BuildContext context) {
    return GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
      childAspectRatio: 3/2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 15,
    ),
    padding: EdgeInsets.all(10),
    children: [
      ...my_categories.map((c_item){
        return CategoryItem(c_item);
    }).toList()
    ],);
  }
}
