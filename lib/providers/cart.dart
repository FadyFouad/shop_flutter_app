import 'package:flutter/material.dart';

///****************************************************
///*** Created by Fady Fouad on 03-Apr-20 at 18:33.***
///****************************************************

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems => {..._cartItems};

  int get getItemCount => _cartItems == null ? 0 : _cartItems.length;

  double get getTotalMoney {
    double amount = 0.0;
    _cartItems.forEach((key, value) {
      amount += value.price * value.quantity;
    });
    return amount;
  }
  void addToCart(String id, String title, double price) {
    if (_cartItems.containsKey(id)) {
      _cartItems.update(
        id,
        (value) => CartItem(
            id: value.id,
            title: value.title,
            quantity: value.quantity + 1,
            price: value.price),
      );
    } else {
      _cartItems.putIfAbsent(
        id,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            quantity: 1,
            price: price),
      );
    }
    notifyListeners();
  }

  void deleteItem(String id) {
    _cartItems.remove(id);
    notifyListeners();
  }
}

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}
