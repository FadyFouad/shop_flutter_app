import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopflutterapp/models/product.dart';
import 'package:shopflutterapp/widgets/product_widget.dart';

///****************************************************
///*** Created by Fady Fouad on 26-Mar-20 at 17:03.***
///****************************************************

class ProductOverViewScreen extends StatelessWidget {
  final String title;

  ProductOverViewScreen({Key key, this.title}) : super(key: key);
  final List<Product> products = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: GridView.builder(
          padding: const EdgeInsets.all(8.0),
          itemBuilder: (BuildContext context, int index) {
            return ProductItem(
              id: products[index].id,
              name: products[index].name,
              imageUrl: products[index].imageUrl,
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0),
          itemCount: products.length,
        ),
      ),
    );
  }
}
