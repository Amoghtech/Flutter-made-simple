import 'package:flutter/material.dart';
import 'package:recipes_app/dummy_data.dart';
import 'package:recipes_app/screens/filters_screen.dart';
import 'package:recipes_app/screens/meal_detail_screen.dart';
import 'package:recipes_app/screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './models//meal.dart';
import './screens/categories_screen.dart';
import 'package:recipes_app/dummy_data.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false
  };
List<Meal> availablemeals=DUMMY_MEALS;


  void _setfilters(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;
      availablemeals=DUMMY_MEALS.where((element){
if(_filters['gluten'] && !element.isGlutenFree) {
return false;
}



      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      // home: CategoriesScreen(),
      routes: {
        // '/': (ctx) => CategoriesScreen(),
        '/': (ctx) => TabScreen(),
        Categorymealsscreen.routeName: (ctx) => Categorymealsscreen(availablemeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setfilters)
      },
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //   // if(settings.name=='/...'){
      //   // return ...
      //   // }
      //   return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
