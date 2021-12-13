import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class Categorymealsscreen extends StatefulWidget {
  // final String categoryid;
  // final String categorytitle;
  static const routeName = '/category_meals';
final List<Meal> availablemeals;
  Categorymealsscreen(this.availablemeals);
  
  @override
  State<Categorymealsscreen> createState() => _CategorymealsscreenState();
}

class _CategorymealsscreenState extends State<Categorymealsscreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedinitdata = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
    if (_loadedinitdata) {
      return;
    }
    final routeargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    print(routeargs['id']);
    // setState(() {
    categoryTitle = routeargs['title'];
    displayedMeals = widget.availablemeals
        .where((element) => element.categories.contains(routeargs['id']))
        .toList();
    // });
    _loadedinitdata = true;
  }

  void _removemeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle != null ? categoryTitle : 'Hello'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Mealitem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            removeitem: _removemeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
