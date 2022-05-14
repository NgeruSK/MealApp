import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../dummy_data.dart';
import '../screens/filter_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../widgets/category_item.dart';
import 'models/meal_model.dart';
import 'screens/screen_dashboard.dart';

import 'screens/screen_meal.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static const routeName = 'login-page';


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  Map<String, bool> _filters = {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false
  };



  List<Meal> availableMeals = DUMMY_MEALS;

  List<Meal> favourite_meals = [];

  void _addFavourite(Meal meal_fav)
  {
    setState(() {
      if(favourite_meals.contains(meal_fav))
        {
          print('present');
          favourite_meals.remove(meal_fav);
        }
      else{
        print('absent');
        favourite_meals.add(meal_fav);
      }

    });
  }

  void _setFilters(Map<String, bool> filterData)
  {
    print(filterData.toString());
    setState(() {
      _filters = filterData;

      availableMeals = DUMMY_MEALS.where((element){

        if(_filters['gluten']! && !element.isGlutenFree)
        {
          return false;
        }
        if(_filters['lactose']! && !element.isLactoseFree)
        {
          return false;
        }
        if(_filters['vegan']! && !element.isVegan)
        {
          return false;
        }
        if(_filters['vegetarian']! && !element.isVegetarian)
        {
          return false;
        }

        return true;

      }).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue, accentColor: Colors.amber,),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: const TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold
          )
        ),
      ),
      home: DashBoard(favourite_meals),
      routes: {
        CategoryMealScreen.routeName : (ctx) => CategoryMealScreen(availableMeals),
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(_addFavourite, favourite_meals),
        DashBoard.routeName : (ctx) => DashBoard(favourite_meals),
        MyApp.routeName : (ctx) => MyApp(),
        FilterScreen.routeName : (ctx) => FilterScreen(_setFilters,_filters),
      },

      onUnknownRoute: (settings)
      {
        return MaterialPageRoute(builder: (ctx) => MyHomePage());
      },
    );
  }
}


class MyHomePage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>
{
  TextEditingController username_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/login_bg.png'),
                fit: BoxFit.cover )),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.asset('assets/images/logo_white.png'),
                  ),
                  Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 25),),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(onSubmitted: (s){},
                    controller: username_controller,
                    decoration: InputDecoration(labelText: 'Username', labelStyle: TextStyle(color: Colors.orange),),
                    style: TextStyle(color: Colors.white),),

                  SizedBox(
                    height: 30,
                  ),
                  TextField(onSubmitted: (s){},
                    controller: password_controller,
                    decoration: InputDecoration(labelText: 'Password', labelStyle: TextStyle(color: Colors.orange),),
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(onPressed: (){
                      Navigator.of(context).pushNamed(DashBoard.routeName);
                    },
                        style: ElevatedButton.styleFrom(primary: Colors.orange,
                            onPrimary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        child: Text('Login',style: TextStyle(fontSize: 20),)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
