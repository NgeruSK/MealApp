import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';

import '../models/meal_model.dart';

class MealItem extends StatelessWidget {
  Meal selected_meal;


  MealItem(@required this.selected_meal);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
        ),
            elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15), 
                    topRight: Radius.circular(15),
                  ),
                    child: Image.network(selected_meal.imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover),
                  ),
                  Positioned(
                    bottom: 20,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.all(10),
                          width: 300,
                          color: Colors.black54,
                          child: Text(selected_meal.title, style: TextStyle(fontSize: 26, color: Colors.white),softWrap: true,overflow: TextOverflow.fade,)))
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     Row(
                       children: [
                         Icon(Icons.schedule,),
                         SizedBox(
                           width: 6,
                         ),
                         Text('${selected_meal.duration} mins')
                       ],
                     ),
                    Row(
                      children: [
                        Icon(Icons.work,),
                        SizedBox(
                          width: 6,
                        ),
                        Text(complexityText)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.money ,),
                        SizedBox(
                          width: 6,
                        ),
                        Text(availabilityText)
                      ],
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }

  String get complexityText{
    switch(selected_meal.complexity){
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get availabilityText{
    switch(selected_meal.affordability){
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      case Affordability.Affordable:
        return 'Affordable';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: selected_meal).then((value) {
      if(value != null)
        {
          print(value);
        }
    });
  }
}
