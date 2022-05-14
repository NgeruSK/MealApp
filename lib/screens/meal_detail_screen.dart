import 'package:flutter/material.dart';
import '../screens/screen_meal.dart';
import '../models/meal_model.dart';

class MealDetailScreen extends StatelessWidget {
static const routeName = '/meal-detail';
Meal? my_meal;
Function _addFav;
List<Meal> favMeals;
MealDetailScreen(this._addFav, this.favMeals);

  @override
  Widget build(BuildContext context) {

    my_meal = ModalRoute.of(context)?.settings.arguments as Meal;

    Widget buildSectionTitle(BuildContext context, String text)
    {
      return  Container(
        margin: EdgeInsets.symmetric(vertical : 10),
        child: Text(text,style: Theme.of(context).textTheme.titleMedium,),
      );
    }

    Widget buildContainer({required Widget child})
    {
      return  Container(
        height: MediaQuery.of(context).size.height * 0.27,
        width: 300,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),

        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(my_meal!.title, ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              child: Image.network(my_meal!.imageUrl,fit: BoxFit.cover,),
            ),
            buildSectionTitle(context, 'Ingredients'),

            buildContainer(child : ListView.builder(itemBuilder: (ctx, index)
              {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(my_meal!.ingredients[index])),
                );
              },
              itemCount: my_meal!.ingredients.length,),
            ),
            buildSectionTitle(context, 'Steps'),

            buildContainer(child :  ListView.builder(itemBuilder: (ctx, index)
            {
              return Column(
                children : [ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${(index + 1)}'),
                  ),
                  title: Text(my_meal!.steps[index]),
                ),

                  Divider(),
            ]
              );
            },
              itemCount: my_meal!.steps.length,),
            ),
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(favMeals.contains(my_meal)?Icons.star : Icons.star_border),
        onPressed: () => _addFav(my_meal),
        
      ),


    );
  }
}
