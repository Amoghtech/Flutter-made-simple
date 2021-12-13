import 'package:flutter/material.dart';
import 'package:recipes_app/screens/categories_screen.dart';
import 'package:recipes_app/screens/favorites_screen.dart';
import 'package:recipes_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Favorites'}
  ];
  int _selectedpageindex = 0;

  void _selectpage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _pages[_selectedpageindex]['title'] as String,
          ),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedpageindex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectpage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedpageindex,
          // type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text("Categroeis")),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), title: Text("Favorites"))
          ],
        ));
  }
}
