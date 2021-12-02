import 'package:flutter/material.dart';
import 'package:recipes_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/mealdetail';

  @override
  Widget build(BuildContext context) {
    final mealargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final meal =
        DUMMY_MEALS.where((element) => element.id == mealargs['id']).toList();
    return Scaffold(
      body: Container(),
      appBar: AppBar(
        title: Text(meal[0].title),
      ),
    );
  }
}
