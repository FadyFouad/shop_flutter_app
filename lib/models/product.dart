import 'package:flutter/cupertino.dart';

///****************************************************
///*** Created by Fady Fouad on 26-Mar-20 at 17:04.***
///****************************************************

class Product {
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
}
