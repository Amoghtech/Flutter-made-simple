import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:placeapp/helpers/db_helper.dart';
import 'package:placeapp/screens/add_place_screen.dart';
import 'dart:io';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  void addplace(String title, File image) {
    final newplace = Place(
        id: DateTime.now().toString(),
        Image: image,
        title: title,
        location: null);
    _items.add(newplace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newplace.id,
      'title': newplace.title,
      'image': newplace.Image.path
    });
  }

  Future<void> fetchplaces() async {
    final datalist = await DBHelper.getdata('user_places');
    datalist
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            Image: File(item['image']),
            location: null))
        .toList();
     notifyListeners();   
  }
}
