import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflutterapp/providers/products.dart';
import 'package:shopflutterapp/widgets/product_widget.dart';

///****************************************************
///*** Created by Fady Fouad on 26-Mar-20 at 17:03.***
///****************************************************

class ProductOverViewScreen extends StatelessWidget {
  final String title;

  ProductOverViewScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: ProductGridView(),
      ),
    );
  }
}

class ProductGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.productList;
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (BuildContext context, int index) {
        return ChangeNotifierProvider(
          create: (BuildContext context) {
            return Products();
          },
          child: ProductItem(
//            id: products[index].id,
//            name: products[index].name,
//            imageUrl: products[index].imageUrl,
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0),
      itemCount: products.length,
    );
  }
}
