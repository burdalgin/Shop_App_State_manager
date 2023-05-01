import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class OrderItemWidget extends StatelessWidget {
  final OrderItems order;

  OrderItemWidget(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle:
                Text(DateFormat('dd MM yyyy hh:mm').format(order.dateTime)),
            trailing:
                IconButton(onPressed: (() {}), icon: Icon(Icons.expand_more)),
          ),
        ],
      ),
    );
  }
}
