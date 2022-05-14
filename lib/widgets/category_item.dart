import 'package:flutter/material.dart';
import '../../models/category_model.dart';
import '../screens/screen_meal.dart';

class CategoryItem extends StatelessWidget {

  Category my_category;
  CategoryItem(this.my_category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
      padding: EdgeInsets.only(left : 20, top: 0, right : 20,bottom: 0),
        child: Center(child: Text(my_category.title, style: Theme.of(context).textTheme.titleMedium)),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [my_category.color.withOpacity(0.7), my_category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15)
        ),
      ),
      onTap: () => selectCategory(context),
    );
  }

  void selectCategory(BuildContext ctx)
  {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName, arguments: {'category' : my_category});
  }
}
