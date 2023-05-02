import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import '../widgets/order_item.dart';
import '../providers/orders.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.items.length,
        itemBuilder: (ctx, index) => OrderItemWidget(orders.items[index]),
      ),
    );
  }
}
