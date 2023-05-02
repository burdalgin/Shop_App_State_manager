import 'package:flutter/material.dart';

import '../providers/orders.dart';
import 'package:intl/intl.dart';

import 'dart:math';

class OrderItemWidget extends StatefulWidget {
  final OrderItems order;

  OrderItemWidget(this.order);

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
                DateFormat('dd/MM/yyyy/hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
                onPressed: (() {
                  setState(() {
                    _expanded = !_expanded;
                  });
                }),
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more)),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.all(10),
              height: min(widget.order.orderProducts.length * 20.0 + 30, 150),
              child: ListView(
                children: widget.order.orderProducts
                    .map(
                      (orderProduct) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            orderProduct.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                              'Count ${orderProduct.quantity}X \$${orderProduct.price}'),
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
