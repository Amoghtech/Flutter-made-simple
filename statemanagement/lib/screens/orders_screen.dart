import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';
import '../providers/orders.dart' show Orders;

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final ordersdata = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders!')),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderItem(ordersdata.orders[i]),
        itemCount: ordersdata.orders.length,
      ),
      drawer: AppDrawer(),
    );
  }
}
