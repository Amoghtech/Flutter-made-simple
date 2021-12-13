import 'package:flutter/material.dart';

import 'package:recipes_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;

  FiltersScreen(this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenfree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosefree = false;

  Widget buildSwitchListTile(String title, String description,
      bool currentvalue, Function updatevalue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentvalue,
        onChanged: updatevalue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(onPressed: widget.saveFilters, icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  'Gluten-free', 'Only Include gluten-free meals', _glutenfree,
                  (newvalue) {
                _glutenfree = newvalue;
              }),
              buildSwitchListTile('Lactose-Free',
                  'Only Include Lactose Free meals', _lactosefree, (newvalue) {
                _lactosefree = newvalue;
              }),
              buildSwitchListTile(
                  'Vageterian-meals',
                  'Only Include Vageterian meals meals',
                  _vegetarian, (newvalue) {
                _vegetarian = newvalue;
              }),
              buildSwitchListTile('Vegan', 'Only Include Vegan meals', _vegan,
                  (newvalue) {
                _vegan = newvalue;
              })
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
