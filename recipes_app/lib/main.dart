import 'package:flutter/material.dart';
import 'package:recipes_app/screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';

import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
          '/': (ctx) => CategoriesScreen(),
          Categorymealsscreen.routeName: (ctx) => Categorymealsscreen(),
          MealDetailScreen.routeName:(ctx)=>MealDetailScreen()
        },
        // onGenerateRoute: (settings){
        //   print(settings.arguments);
        //   // if(settings.name=='/...'){
        //   // return ...
        //   // }
        //   return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
        // },
        onUnknownRoute: (settings){
          return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
        },
        );
  }
}
