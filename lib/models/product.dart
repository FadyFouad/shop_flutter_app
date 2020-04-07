import 'package:flutter/material.dart';

///****************************************************
///*** Created by Fady Fouad on 26-Mar-20 at 17:04.***
///****************************************************

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  bool isFav;

  Product(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.imageUrl,
      @required this.price,
      this.isFav = false});


  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, imageUrl: $imageUrl, price: $price, isFav: $isFav}';
  }

  void toggleFav(){
    isFav =! isFav;
    notifyListeners();
  }
}
