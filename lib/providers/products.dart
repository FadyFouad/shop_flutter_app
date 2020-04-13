import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'package:shopflutterapp/models/product.dart';

///****************************************************
///*** Created by Fady Fouad on 31-Mar-20 at 01:53.***
///****************************************************

class Products with ChangeNotifier {
  List<Product> _productList = [
    /*
    Product(
      id: 'p1',
      name: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
      'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      name: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      name: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
      'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      name: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  */
  ];

  List<Product> get productList => [..._productList];

  List<Product> get favProductList =>
      _productList.where((product) => product.isFav).toList();

  Future<void> fetchProduct() async {
    const url = 'https://test-27222.firebaseio.com/products.json';
    print('fetchProduct()');
    try {
      final results = await Http.get(url);
      final List<Product> loadedProducts = [];
      final serverProducts = json.decode(results.body) as Map<String, dynamic>;
      serverProducts.forEach((key, value) {
        loadedProducts.add(
          Product(
            id: key,
            title: value['title'],
            imageUrl: value['imageUrl'],
            price: value['price'],
            description: value['desc'],
            isFav: value['isFav'],
          ),
        );
      });
      _productList = loadedProducts;
      print('_productList.length = ${_productList.length}');
    } catch (e) {
      throw (e);
    }
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    const url = 'https://test-27222.firebaseio.com/products.json';
    try {
      final response = await Http.post(
        url,
        body: json.encode({
          'title': product.title,
          'desc': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'isFav': product.isFav,
        }),
      );
//      print(response.toString());
      product = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        imageUrl: product.imageUrl,
        price: product.price,
        isFav: product.isFav,
      );
    } catch (e) {
//      print(e);
      throw e;
    }
    _productList.add(product);
    notifyListeners();
  }

  void editProduct(String id, Product product) {
    final index = _productList.indexWhere((element) => product.id == id);
    _productList[index] = product;
    notifyListeners();
  }

  void removeProduct(String id) {
    _productList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Product getProduct(String id) =>
      productList.firstWhere((product) => id == product.id);
}
