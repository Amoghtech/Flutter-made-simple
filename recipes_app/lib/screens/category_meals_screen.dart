import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class Categorymealsscreen extends StatelessWidget {
  // final String categoryid;
  // final String categorytitle;
  static const routeName = '/category_meals';
  // Categorymealsscreen(this.categoryid, this.categorytitle);

  @override
  Widget build(BuildContext context) {
    final routeargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categorymeals = DUMMY_MEALS
        .where((element) => element.categories.contains(routeargs['id']))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeargs['title'] != null ? routeargs['title'] : 'Hello'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Mealitem(
            id: categorymeals[index].id,
            title: categorymeals[index].title,
            imageUrl: categorymeals[index].imageUrl,
            duration: categorymeals[index].duration,
            affordability: categorymeals[index].affordability,
            complexity: categorymeals[index].complexity,
          );
        },
        itemCount: categorymeals.length,
      ),
    );
  }
}
