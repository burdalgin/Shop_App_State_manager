import 'package:flutter/foundation.dart';
import '../providers/cart_provider.dart';

class OrderItems {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItems({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItems> _orders = [];

  List<OrderItems> get items {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double amount) {
    _orders.insert(
        0,
        OrderItems(
            id: DateTime.now().toString(),
            amount: amount,
            products: cartProducts,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
