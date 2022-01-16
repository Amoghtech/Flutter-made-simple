import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toggleFavoriteStatus() async {
    final url = Uri.parse(
        'https://flutter-one-61f63-default-rtdb.firebaseio.com/products/${id}.json');
    var oldvalue = isFavorite;
   try{
      final res = await http.patch(url,
          body: json.encode({'isFavorite': !this.isFavorite}));
      if (res.statusCode >= 400) {
        isFavorite = oldvalue;
        notifyListeners();
        return;
      }
      isFavorite = !isFavorite;
      notifyListeners();
    } catch (err) {
      isFavorite = oldvalue;
      notifyListeners();
    }
  }
}
