import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/meal_model.dart';
import '../screens/bottom_nav_screen.dart';
import '../screens/tab_screen.dart';
import '../widgets/content_categories.dart';

class DashBoard extends StatelessWidget {

  static const String routeName = '/dashboard';

  List<Meal> fav_meals;

  DashBoard(this.fav_meals);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: HomePage(fav_meals),
    );
  }
}
class HomePage extends StatefulWidget{
  List<Meal> fav_meals;
  HomePage(this.fav_meals);
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}
class _HomeState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavBar(widget.fav_meals),
     // body: TabsScreen(),
    );
  }
}
