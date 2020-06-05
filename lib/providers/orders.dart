import 'package:flutter/cupertino.dart';

import './cart.dart';

class Order {
  final String id;
  final double amount;
  final List<CartItem> product;
  final DateTime date;

  Order({
    this.amount,
    this.date,
    this.id,
    this.product,
  });
}

class Orders with ChangeNotifier {
  List<Order> _orders = [];
}
