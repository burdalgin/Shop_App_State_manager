import 'dart:developer';

import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {}; //если не иницаоизировать будет ошибка Null

  Map<String, CartItem>
      get item //_items прватна переменная, items к которой можно получить доступ через get, т.е.
  {
    return {..._items};
  }

  int get itemCount // подсчет кол-во товаров в корзине
  {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price,
      String title) //метод добавления продукта в корзину
  {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingItem) => CartItem(
              id: existingItem.id,
              title: existingItem.title,
              quantity: existingItem.quantity + 1,
              price: existingItem.price));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }

  int countOfProductsInaCart(
      String title) //метод который возврашает элемент по заданному ID
  {
    return _items.values.where((element) => element.title == title).length;
  }
}
