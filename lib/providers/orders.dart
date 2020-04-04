import 'package:flutter/material.dart';
import 'package:shopflutterapp/providers/cart.dart';

///****************************************************
///*** Created by Fady Fouad on 04-Apr-20 at 17:10.***
///****************************************************

class Orders with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  void addOrder(List<CartItem> cartList, double total) {
    _orders.insert(
        0,
        Order(
            id: DateTime.now().toString(),
            amount: total,
            products: cartList,
            date: DateTime.now()));
    notifyListeners();
  }
}

class Order {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime date;

  Order(
      {@required this.id,
      @required this.amount,
      @required this.products,
      @required this.date});
}
