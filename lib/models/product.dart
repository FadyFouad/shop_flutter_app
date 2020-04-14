import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;

///****************************************************
///*** Created by Fady Fouad on 26-Mar-20 at 17:04.***
///****************************************************

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFav;

  Product({@required this.id,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.price,
    this.isFav = false});

  @override
  String toString() {
    return 'Product{id: $id, title: $title, description: $description, imageUrl: $imageUrl, price: $price, isFav: $isFav}';
  }

  Future<void> toggleFav() async {
    final url = 'https://test-27222.firebaseio.com/products/$id.json';
    final oldState = isFav;
    isFav = !isFav;
    try {
      await Http.patch(url,
          body: json.encode(
            {
              'isFav': isFav,
            },
          ));
    } catch (e) {
      isFav = oldState;
    }
    notifyListeners();
  }
}
