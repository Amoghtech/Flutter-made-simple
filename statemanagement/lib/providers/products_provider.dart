import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  void addProduct(value) {
    _items.add(value);
    notifyListeners(); //given by Provider package
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
