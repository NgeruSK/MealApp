import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/meal_model.dart';
import '../screens/favourites_screen.dart';
import '../widgets/content_categories.dart';
import '../widgets/main_drawer.dart';

class BottomNavBar extends StatefulWidget {
   List<Meal> fav_meals;

   BottomNavBar(this.fav_meals);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int selected_index = 0;

   late List<Map<String, dynamic>> pages;

  @override
  void initState() {
    // TODO: implement initState
    pages = [
      {
        'widget': CategoriesScreen(),
        'title': 'All Categories'
      },
      {
        'widget': FavouritesScreen(widget.fav_meals),
        'title': 'My Favorites'
      }
    ];
    super.initState();
  }


  void _switchPage(index)
  {
    setState(() {
      selected_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pages[selected_index]['title']),
        centerTitle: true,),
      drawer: MainDrawer(),

      body: pages[selected_index]['widget'],

      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected_index,
        onTap: _switchPage,
        backgroundColor: Theme.of(context).accentColor,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        items: [BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
