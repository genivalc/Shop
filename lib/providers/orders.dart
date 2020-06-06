import 'dart:math';

import 'package:flutter/cupertino.dart';

import './cart.dart';

class Order {
  final String id;
  final double total;
  final List<CartItem> product;
  final DateTime date;

  Order({
    this.total,
    this.date,
    this.id,
    this.product,
  });
}

class Orders with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(Cart cart) {
    _items.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        date: DateTime.now(),
        product: cart.items.values.toList(),
      ),
    );
    notifyListeners();
  }
}
