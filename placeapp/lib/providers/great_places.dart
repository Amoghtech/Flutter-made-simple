import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
  }
}
