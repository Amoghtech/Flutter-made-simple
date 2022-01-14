import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime date;

  OrderItem(
      {@required this.id,
      @required this.amount,
      @required this.date,
      @required this.products});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addorder(List<CartItem> cartproducts, double total) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            date: DateTime.now(),
            products: cartproducts));

    notifyListeners();
  }



}
